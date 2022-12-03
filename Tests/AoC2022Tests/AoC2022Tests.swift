import XCTest
@testable import AoC2022

final class AoC2022Tests: XCTestCase {

    func testDay1Part1() throws {
        let file = file(forDay: 1)
        let input = parseDay1Input(from: file)
        
        let result = day1part1(input: input)
        XCTAssertEqual(result, 69177)
    }
    
    func testDay1Part2() throws {
        let file = file(forDay: 1)
        let input = parseDay1Input(from: file)
        
        let result = day1part2(input: input)
        XCTAssertEqual(result, 207456)
    }
    
    
    func testDay2Part1() throws {
        let file = file(forDay: 2)
        let input = parseDay2Input(from: file)
        
        let result = day2part1(input: input)
        XCTAssertEqual(result, 11603)
    }
    
    func testDay2Part2() throws {
        let file = file(forDay: 2)
        let input = parseDay2Input(from: file)
        
        let result = day2part2(input: input)
        XCTAssertEqual(result, 12725)
    }
    func testDay3Part1() throws {
        let file = file(forDay: 3)
        let input = parseDay3Input(from: file)
        
        let result = day3part1(input: input)
        XCTAssertEqual(result, 7917)
    }
    
    func testDay3Part2() throws {
        let file = file(forDay: 3)
        let input = parseDay3Input(from: file)
        
        let result = day3part2(input: input)
        XCTAssertEqual(result, 2585)
    }
}



