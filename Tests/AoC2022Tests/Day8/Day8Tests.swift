//import Foundation
//import XCTest
//@testable import AoC2022
//
//final class Day8Tests: XCTestCase {
//    
//    func testExample() {
//        let input = """
//                    30373
//                    25512
//                    65332
//                    33549
//                    35390
//                    """
//        XCTAssertEqual(day8part1(input: parseDay8Input(from: input)), 21)
//    }
//    
//    func testVisibilityFromNorthForGridpoint_X0_Y0() {
//        let input = """
//                    30373
//                    25512
//                    65332
//                    33549
//                    35390
//                    """
//        let grid = parseDay8Input(from: input)
//        
//        XCTAssertEqual(visibilityFromNorth(grid: grid, x: 0, y: 0).0, true)
//    }
//    
//    func testVisibilityFromNorthForGridpoint_X2_Y3() {
//        let input = """
//                    30373
//                    25512
//                    65332
//                    33549
//                    35390
//                    """
//        let grid = parseDay8Input(from: input)
//        
//        XCTAssertEqual(visibilityFromNorth(grid: grid, x: 2, y: 3).0, false)
//    }
//    
//    func testVisibilityFromSouthForGridpoint_X2_Y3() {
//        let input = """
//                    30373
//                    25512
//                    65332
//                    33549
//                    35390
//                    """
//        let grid = parseDay8Input(from: input)
//        
//        XCTAssertEqual(visibilityFromSouth(grid: grid, x: 2, y: 3).0, true)
//    }
//    
//    func testEmptyGrid() {
//        let input = """
//                    00000
//                    01110
//                    01210
//                    01110
//                    00000
//                    """
//        XCTAssertEqual(day8part1(input: parseDay8Input(from: input)), 25)
//    }
//    
//    func testReversedGrid() {
//        let input = """
//                    22222
//                    21112
//                    21012
//                    21112
//                    22222
//                    """
//        XCTAssertEqual(day8part1(input: parseDay8Input(from: input)), 16)
//    }
//    
//    func testVisibilityGridForExample() {
//        let input = """
//                    30373
//                    25512
//                    65332
//                    33549
//                    35390
//                    """
//        
//        let result = """
//                     11111
//                     11101
//                     11011
//                     10101
//                     11111
//                     """
//        
//        XCTAssertEqual(makeVisibilityGrid(for: parseDay8Input(from: input)).description, result)
//    }
//    
//    func testScenicScoreForExample() {
//        let input = """
//                    30373
//                    25512
//                    65332
//                    33549
//                    35390
//                    """
//        
//        XCTAssertEqual(day8part2(input: parseDay8Input(from: input)), 8)
//    }
//    
//    func testScenicScoreForGridpoint_X2_Y3() {
//        let input = """
//                    30373
//                    25512
//                    65332
//                    33549
//                    35390
//                    """
//        let grid = parseDay8Input(from: input)
//        
//        XCTAssertEqual(scenicScoreForGridpoint(grid: grid, x: 2, y: 3), 8)
//    }
//    
//    func testScenicScoreForGridpoint_X2_Y1() {
//        let input = """
//                    30373
//                    25512
//                    65332
//                    33549
//                    35390
//                    """
//        let grid = parseDay8Input(from: input)
//        
//        XCTAssertEqual(scenicScoreForGridpoint(grid: grid, x: 2, y: 1), 4)
//    }
//    
//}
