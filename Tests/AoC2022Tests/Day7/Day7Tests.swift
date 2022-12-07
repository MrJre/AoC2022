import Foundation
import XCTest
@testable import AoC2022

final class Day7Tests: XCTestCase {
    func testExamplePart1() {
        let input = """
                    $ cd /
                    $ ls
                    dir a
                    14848514 b.txt
                    8504156 c.dat
                    dir d
                    $ cd a
                    $ ls
                    dir e
                    29116 f
                    2557 g
                    62596 h.lst
                    $ cd e
                    $ ls
                    584 i
                    $ cd ..
                    $ cd ..
                    $ cd d
                    $ ls
                    4060174 j
                    8033020 d.log
                    5626152 d.ext
                    7214296 k
                    """
        
        let score = day7part1(input: parseDay7Input(from: input))
        XCTAssertEqual(score, 95437)
    }
    
    func testExamplePart2() {
        let input = """
                    $ cd /
                    $ ls
                    dir a
                    14848514 b.txt
                    8504156 c.dat
                    dir d
                    $ cd a
                    $ ls
                    dir e
                    29116 f
                    2557 g
                    62596 h.lst
                    $ cd e
                    $ ls
                    584 i
                    $ cd ..
                    $ cd ..
                    $ cd d
                    $ ls
                    4060174 j
                    8033020 d.log
                    5626152 d.ext
                    7214296 k
                    """
        
        let score = day7part2(input: parseDay7Input(from: input))
        XCTAssertEqual(score, 24933642)
    }
    
    func testParseResponseIsDir() {
        let input = "dir a"
        XCTAssertEqual(parseResponse(line: input), Response.dir(name: "a"))
    }
    
    func testParseResponseIsFile() {
        let input = "5626152 d.ext"
        XCTAssertEqual(parseResponse(line: input), Response.file(size: 5626152, name: "d.ext"))
    }
}
