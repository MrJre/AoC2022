import Foundation

func day6part1(input: [String]) -> Int {
    return lastIndexForMarker(for: input, numberOfPackets: 4) + 1
}

func day6part2(input: [String]) -> Int {
    return lastIndexForMarker(for: input, numberOfPackets: 14) + 1
}

func lastIndexForMarker(for emission: [String], numberOfPackets: Int) -> Int {
    for i in 0..<emission.count - (numberOfPackets - 1) {
        let set = Set(emission[i..<i + numberOfPackets])
        if set.count == numberOfPackets { return i + (numberOfPackets - 1) }
    }
    
    return 0
}
