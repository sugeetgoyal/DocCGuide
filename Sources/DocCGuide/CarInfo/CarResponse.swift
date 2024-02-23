/// ``CarResponse`` is the respose of Car received from server
///
/// CarRespose is a response model which will be stored from the API service response
///
///  ``init(from:)``  initializer, can be used to initialize this response model
///
/// ```swift
///     let carReponse = try? JSONDecoder().decode(CarResponse.self, from: <#T##Data#>)
///     print(carResponse)
/// ```
///

public struct CarResponse: Decodable {
    let results: [Car]
    
    enum CodingKeys: CodingKey {
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([Car].self, forKey: .results)
    }
}
