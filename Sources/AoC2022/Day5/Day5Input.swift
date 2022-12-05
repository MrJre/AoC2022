import Foundation
import RegexBuilder

func parseDay5Input(from file: String) -> ([[String]], [MoveInstruction]) {
    let result = file.components(separatedBy: "\n")
    
    let indexOfEmptyLine: Int! = result.firstIndex { $0.isEmpty }
    let stacks = parseStacks(from: Array(result[0..<indexOfEmptyLine - 1]))
    let moves = parseMoves(from: Array(result[(indexOfEmptyLine + 1)..<(result.endIndex - 1)]))

    return (stacks, moves)
}

func parseStacks(from stackStrings: [String]) -> [[String]] {
    let strippedLines = stackStrings.map { line in
        line.enumerated().filter { ($0.offset - 1) % 4 == 0 }.map{ $0.element }
    }
    
    let numberOfStacks = strippedLines.reduce(0) { max($0, $1.count) }
    var stacks = [[String]](repeating: [], count: numberOfStacks)
    
    for line in strippedLines {
        for (index, char) in line.enumerated() {
            if char.isLetter { stacks[index].append(String(char)) }
        }
    }
    return stacks.map { $0.reversed() }
}

func parseMoves(from moveStrings: [String]) -> [MoveInstruction] {
    let regex = Regex {
        "move "
        Capture { OneOrMore(.digit) } transform: { substring -> Int in Int(String(substring))! }
        " from "
        Capture { OneOrMore(.digit) } transform: { substring -> Int in Int(String(substring))! }
        " to "
        Capture { OneOrMore(.digit) } transform: { substring -> Int in Int(String(substring))! }
    }
    
    return moveStrings.flatMap {
        $0.matches(of: regex).map { MoveInstruction(number: $0.output.1, from: $0.output.2, to: $0.output.3) }
    }
}

struct MoveInstruction {
    let number: Int
    let from: Int
    let to: Int
}
