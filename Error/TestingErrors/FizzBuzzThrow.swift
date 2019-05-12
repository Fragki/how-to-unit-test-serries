import Foundation

class FizzBuzzThrow {
    
    public enum FizzBuzzError: Error, Equatable {
        case fizzError
        case buzzError
        case fizzBuzzError
    }
    
    public func fizzBuzz(_ input: Int) throws -> String {
        
        switch (isDivisibleBy(numerator: input, denominator: 3), isDivisibleBy(numerator: input, denominator: 5)) {
        case (true, true):
            throw FizzBuzzError.fizzBuzzError
        case (true, false):
            throw FizzBuzzError.fizzError
        case (false, true):
            throw FizzBuzzError.buzzError
        default:
            return "\(input)"
        }
        
    }
    
    private func isDivisibleBy(numerator: Int, denominator: Int) -> Bool {
        return numerator % denominator == 0
    }

}
