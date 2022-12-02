import Foundation

func day2part1(input: [(String, String)]) -> Int {
    return input.reduce(0, score)
}

func day2part2(input: [(String, String)]) -> Int {
    let transform: [(String, String)] = input.map {
        guard let sym = determineSymbol(pair: $0) else { return nil }
        return ($0.0, sym)
    }.compactMap{$0}
    return transform.reduce(0, score)
}

private func score(acc: Int, pair: (String, String)) -> Int {
    var score = 0
    switch pair {
        case ("A","Y"), ("B","Z"), ("C","X"): score = 6
        case ("A","X"), ("B","Y"), ("C","Z"): score = 3
        default: break
    }
    return score + scoreSymbol(symbol: pair.1) + acc
}

private func determineSymbol(pair: (String, String)) -> String? {
    switch pair.1 {
        case "X":
            switch pair.0 {
                case "A": return "Z"
                case "B": return "X"
                case "C": return "Y"
                default: return nil
            }
        case "Y":
            switch pair.0 {
                case "A": return "X"
                case "B": return "Y"
                case "C": return "Z"
                default: return nil
            }
        case "Z":
            switch pair.0 {
                case "A": return "Y"
                case "B": return "Z"
                case "C": return "X"
                default: return nil
            }
        default: return nil
    }
}

private func scoreSymbol(symbol: String) -> Int {
    switch symbol {
        case "X": return 1
        case "Y": return 2
        case "Z": return 3
        default: return 0
    }
}
