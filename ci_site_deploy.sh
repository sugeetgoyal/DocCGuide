!/bin/bash

rm -rf docsData

echo "Building DocC documentation for DocCGuide..."

xcodebuild -derivedDataPath docsData -scheme DocCGuide -destination 'platform=iOS Simulator,name=iPhone 14' -parallelizeTargets docbuild

echo "Copying DocC archives to doc_archives..."

mkdir doc_archives

cp -R `find docsData -type d -name "*.doccarchive"` doc_archives

mkdir docs

#echo "Processing Archive: ~/Desktop/DocCGuide.doccarchive"
#$(xcrun --find docc) process-archive transform-for-static-hosting ~/Desktop/DocCGuide.doccarchive --hosting-base-path DocCGuide --output-path ~/Desktop/Docs

for ARCHIVE in doc_archives/*.doccarchive; do
    cmd() {
        echo "$ARCHIVE" | awk -F'.' '{print $1}' | awk -F'/' '{print tolower($2)}'
    }
    ARCHIVE_NAME="$(cmd)"
    echo "Processing Archive: $ARCHIVE"
    $(xcrun --find docc) process-archive transform-for-static-hosting "$ARCHIVE" --hosting-base-path DocCGuide --output-path docs
done

rm -rf docsData

git config user.name "sugeetgoyal"

git config user.email "sugeetgoyalbilha@gmail.com"

# Change the GitHub URL to your repository
git remote set-url origin https://sugeetgoyal:<git_token>@github.com/sugeetgoyal/DocCGuide/

git fetch

git stash push -u  -- docs doc_archives

git checkout feature/doc-hosting

rm -rf docs doc_archives

git stash apply

git add docs doc_archives

git commit -m "Updated DocC documentation"

git push --set-upstream origin feature/doc-hosting
