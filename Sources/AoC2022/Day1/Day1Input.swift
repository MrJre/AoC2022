import Foundation

func parseDay1Input(from file: String) -> [[Int]] {
    let elfLines = file.components(separatedBy: "\n\n")
    return elfLines.map { $0.components(separatedBy: "\n").map(Int.init).compactMap{$0} }
}
