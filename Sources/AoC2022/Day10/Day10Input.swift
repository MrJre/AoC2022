import Foundation
import RegexBuilder

func parseDay10Input(from file: String) -> [Instruction] {
    let result = file.components(separatedBy: "\n").filter { !$0.isEmpty }
    return result.map(parseInstruction(line:))
}

func parseInstruction(line: String) -> Instruction {
    let regex = Regex {
        Capture {
            ChoiceOf {
                "addx"
                "noop"
            }
        }
        Optionally {
            " "
            Capture {
                OneOrMore(.any)
            }
        }
    }
    guard let match = line.firstMatch(of: regex) else { fatalError() }
    let instruction = match.output.1
    
    switch instruction {
        case "addx":
            let value: Int = Int(String(match.output.2!))!
            return .addX(value)
        case "noop": return .noop
        default: fatalError()
    }
}



enum Instruction {
    case addX(Int)
    case noop
}
