import Foundation

func parseDay3Input(from file: String) -> [String] {
    let result = file.components(separatedBy: "\n").dropLast()
    return Array(result)
}
