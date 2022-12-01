import Foundation

func day1part1(input: [[Int]]) -> Int {
    let elfCalories = sortedSummedElfCalories(given: input)
    return elfCalories.first!
}

func day1part2(input: [[Int]]) -> Int {
    let elfCalories = sortedSummedElfCalories(given: input)
    return elfCalories.prefix(3).reduce(0, +)
}

func sortedSummedElfCalories(given elves: [[Int]]) -> [Int] {
    let elfCalories = elves.map { $0.reduce(0, +) }
    return elfCalories.sorted(by: >)
}
