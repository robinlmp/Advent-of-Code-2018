import XCTest
@testable import AdventOfCode

final class Day1Tests: XCTestCase, SolutionTest {
    typealias SUT = Day1
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 505)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 72330)
    }
}

extension Day1Tests {
    func testFrenquencySum() {
        let exampleFrencies: [Int] = [+1, -2, +3, +1]
        try XCTAssertEqual(sut.calculateTotal(exampleFrencies), 3)
    }
    
    func testDay2samples() {
        try XCTAssertEqual(sut.returnFirstDuplicateFrequency([+1, -1]), 0)
        try XCTAssertEqual(sut.returnFirstDuplicateFrequency([+3, +3, +4, -2, -4]), 10)
        try XCTAssertEqual(sut.returnFirstDuplicateFrequency([-6, +3, +8, +5, -6]), 5)
        try XCTAssertEqual(sut.returnFirstDuplicateFrequency([+7, +7, -2, -7, -4]), 14)
    }
}
