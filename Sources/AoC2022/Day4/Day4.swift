import Foundation

func day4part1(input: [(ClosedRange<Int>, ClosedRange<Int>)]) -> Int {
    input.reduce(0) {
        $0 + ($1.0.contains(range: $1.1) || $1.1.contains(range: $1.0) ? 1 : 0)
    }
}

func day4part2(input: [(ClosedRange<Int>, ClosedRange<Int>)]) -> Int {
    input.reduce(0) {
        $0 + ($1.0.overlaps($1.1) ? 1 : 0)
    }
}

extension ClosedRange {
    func contains(range: ClosedRange) -> Bool {
        lowerBound <= range.lowerBound && upperBound >= range.upperBound
    }
}
