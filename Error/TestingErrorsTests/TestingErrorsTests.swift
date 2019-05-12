import XCTest
@testable import TestingErrors

class TestingErrorsTests: XCTestCase {

    func test_fizzBuzz_1() {
        let fizzBuzzCalculator = FizzBuzzThrow()
        
        let input = 1
        let result = try? fizzBuzzCalculator.fizzBuzz(input)
        
        XCTAssertEqual("1", result)
    }
    
    func test_fizzBuzz_2() {
        let fizzBuzzCalculator = FizzBuzzThrow()

        let input = 2
        let result = try? fizzBuzzCalculator.fizzBuzz(input)

        XCTAssertEqual("2", result)
    }

    func test_fizzBuzz_3() {
        let fizzBuzzCalculator = FizzBuzzThrow()
        let input = 3

        assertThrow(try fizzBuzzCalculator.fizzBuzz(input), throws: FizzBuzzThrow.FizzBuzzError.fizzError)
    }

    func test_fizzBuzz_multipleOf3() {
        let fizzBuzzCalculator = FizzBuzzThrow()
        let input = 2 * 3
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(input), throws: FizzBuzzThrow.FizzBuzzError.fizzError)
    }

    func test_fizzBuzz_5() {
        let fizzBuzzCalculator = FizzBuzzThrow()
        let input = 5
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(input), throws: FizzBuzzThrow.FizzBuzzError.buzzError)
    }

    func test_fizzBuzz_multipleOf5() {
        let fizzBuzzCalculator = FizzBuzzThrow()
        let input = 2 * 5
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(input), throws: FizzBuzzThrow.FizzBuzzError.buzzError)
    }

    func test_fizzBuzz_multipleOf3AndmultipleOf5() {
        let fizzBuzzCalculator = FizzBuzzThrow()
        let input = 3 * 5
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(input), throws: FizzBuzzThrow.FizzBuzzError.fizzBuzzError)
    }
}

extension XCTestCase { // https://www.swiftbysundell.com/posts/testing-error-code-paths-in-swift
    func assertThrow<T, E: Error & Equatable>(
        _ expression: @autoclosure () throws -> T,
        throws error: E,
        in file: StaticString = #file,
        line: UInt = #line
        ) {
        var thrownError: Error?
        
        XCTAssertThrowsError(try expression(),
                             file: file, line: line) {
                                thrownError = $0
        }
        
        XCTAssertTrue(
            thrownError is E,
            "Unexpected error type: \(type(of: thrownError))",
            file: file, line: line
        )
        
        XCTAssertEqual(
            thrownError as? E, error,
            file: file, line: line
        )
    }
}
