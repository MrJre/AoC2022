import Foundation

func day5part1(input: ([[String]], [MoveInstruction])) -> String {
    var stacks = input.0
    
    for instruction in input.1 {
        for _ in 0..<instruction.number {
            let crate = stacks[instruction.from - 1].popLast()!
            stacks[instruction.to - 1].append(crate)
        }
    }
    
    return stacks.map { $0.last! }.joined()
}

func day5part2(input: ([[String]], [MoveInstruction])) -> String {
    var stacks = input.0
    
    for instruction in input.1 {
        let crates = stacks[instruction.from - 1].suffix(instruction.number)
        stacks[instruction.from - 1].removeLast(instruction.number)
        stacks[instruction.to - 1].append(contentsOf: crates)
    }
    
    return stacks.map { $0.last! }.joined()
}
