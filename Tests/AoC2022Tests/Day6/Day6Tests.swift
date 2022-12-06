import Foundation
import XCTest
@testable import AoC2022

final class Day6Tests: XCTestCase {
    
    func testExampleOne() {
        let input = "bvwbjplbgvbhsrlpgdmjqwftvncz"
        let parsedInput = parseDay6Input(from: input)
        XCTAssertEqual(day6part1(input: parsedInput), 5)
    }
}
