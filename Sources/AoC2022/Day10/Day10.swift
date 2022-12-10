import Foundation

func day10part1(input: [Instruction]) -> Int {
    var result: [Int] = []
    var cycles = 0
    var register = 1
    
    for instruction in input {
        switch instruction {
            case .noop:
                writeCycle(cycles: &cycles, register: register, result: &result)
            case .addX(let value):
                writeCycle(cycles: &cycles, register: register, result: &result)
                writeCycle(cycles: &cycles, register: register, result: &result)
                register += value
        }
    }
    return result.reduce(0, +)
}

func writeCycle(cycles: inout Int, register: Int, result: inout [Int]) {
    cycles += 1
    if shoudWriteToResult(cycle: cycles) {
        result.append(register * cycles)
    }
}

func shoudWriteToResult(cycle: Int) -> Bool {
    (cycle + 20) % 40 == 0
}

func day10part2(input: [Instruction]) -> String {
    var result: [String] = []
    var cycles = 0
    var currentLine: String = ""
    var spriteRange = 0...2
    
    for instruction in input {
        switch instruction {
            case .noop:
                writePixel(to: &currentLine, spriteRange: spriteRange, cycles: &cycles, result: &result)
            case .addX(let value):
                writePixel(to: &currentLine, spriteRange: spriteRange, cycles: &cycles, result: &result)
                writePixel(to: &currentLine, spriteRange: spriteRange, cycles: &cycles, result: &result)
                
                spriteRange = spriteRange.lowerBound + value...spriteRange.upperBound + value
        }
    }
    
    return String(result.flatMap { $0 + "\n" }.dropLast())
}

func writePixel(to currentLine: inout String, spriteRange: ClosedRange<Int>, cycles: inout Int, result: inout[String]) {
    currentLine.append(spriteRange.contains(cycles % 40) ? "#" : ".")
    cycles += 1
    newLineIfNeeded(cycles: cycles, currentLine: &currentLine, result: &result)
}

func newLineIfNeeded(cycles: Int, currentLine: inout String, result: inout [String]) {
    guard cycles % 40 == 0 else { return }
    result.append(currentLine)
    currentLine = ""
}
