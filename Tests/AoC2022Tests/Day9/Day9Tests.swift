import Foundation
import XCTest
@testable import AoC2022

final class Day9Tests: XCTestCase {
    func testExample() {
        let input = """
                    R 4
                    U 4
                    L 3
                    D 1
                    R 4
                    D 1
                    L 5
                    R 2
                    """
        let result = day9part1(input: parseDay9Input(from: input))
        XCTAssertEqual(result, 13)
    }
    
    func testR4() {
        let input = "R 4"
        let result = day9part1(input: parseDay9Input(from: input))
        XCTAssertEqual(result, 4)
    }
}
