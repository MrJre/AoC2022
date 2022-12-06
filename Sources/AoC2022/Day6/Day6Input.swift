import Foundation

func parseDay6Input(from file: String) -> [String] {
    let result = file.components(separatedBy: "\n")
    return Array(result.first!).map(String.init)
}
