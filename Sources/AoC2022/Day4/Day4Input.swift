import Foundation

func parseDay4Input(from file: String) -> [(ClosedRange<Int>, ClosedRange<Int>)] {
    let result = file.components(separatedBy: "\n")
    let elfPairs = result.dropLast().map {
        let pairs = $0.components(separatedBy: ",")
        let firstElf = makeRangeFromString(pairs[0])
        let secondElf = makeRangeFromString(pairs[1])
        return (firstElf, secondElf)
    }
    return elfPairs
}

private func makeRangeFromString(_ range: String) -> ClosedRange<Int>
{
    let bounds = range.components(separatedBy: "-").map(Int.init).compactMap { $0 }
    return ClosedRange(uncheckedBounds: (bounds[0], bounds[1]))
}
