import XCTest
@testable import AdventOfCode

final class Day2Tests: XCTestCase, SolutionTest {
    typealias SUT = Day2
    
    let day2TestLabels = """
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
"""
        .components(separatedBy: .newlines)
        .filter { !$0.isEmpty }
        .map { string in
            BoxLabel(label: string)
        }
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 12)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 0)
    }
}

extension Day2Tests {
    // match ids which differ only by one character
    
    func testDay2() {
//        try XCTAssertEqual(sut.closelyMatchingLabels(labels: day2TestLabels), "fgij")
    }
}
