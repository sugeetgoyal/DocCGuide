import Foundation

public struct Car: Decodable, Hashable, Identifiable {
    public let id: Int
    
    public let name: String
    
    public let model: String
    
    public let numberOfAirBags: Int
    
    public let gear: CarGear
    
    let variant: CarVariant
    
    public func add(number1: Int, number2: Int) -> (Int, Int, Int) {
        return (number1, number2, number1+number2)
    }
}
