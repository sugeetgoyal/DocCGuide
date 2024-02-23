import Foundation

/// ``Car`` contains all info of Car
///
/// This is the Overview
public struct Car: Decodable, Hashable, Identifiable {
    /// ``id`` represents unique id of Car
    public let id: Int
    
    /// ``name`` represents name of Car
    /// This represents the Car name
    ///
    public let name: String
    
    /// ``model`` represents model of Car
    ///
    /// This is a direct discussion
    ///
    ///     This is the discussion in a box
    public let model: String
    
    /// ``numberOfAirBags`` represents number of Air Bags of Car
    public let numberOfAirBags: Int
    
    /// `gear` represents number of gear type of Car
    public let gear: CarGear
    
    /// ``variant`` represents number of variant of Car
    let variant: CarVariant
    
    /// Addition Funtion
    /// - Parameters:
    ///   - number1: number 1 to be added
    ///   - number2: number 2 to be added
    /// - Returns: number 1, number 2, sum of number 1 and number 2
    public func add(number1: Int, number2: Int) -> (Int, Int, Int) {
        return (number1, number2, number1+number2)
    }
}
