import Foundation

func day3part1(input: [String]) -> Int {
    let scores = input.map {
        let median = $0.index($0.startIndex, offsetBy: $0.count / 2)
        let left = Set<Character>($0[$0.startIndex..<median])
        let right = Set<Character>($0[median..<$0.endIndex])
        
        let intersection = left.intersection(right)
        return scoreItem(character: intersection.first!)
    }
    
    return scores.reduce(0, +)
}

func scoreItem(character: Character) -> Int {
    if character.isLowercase {
        return Int(character.asciiValue!) - 97 + 1
    } else {
        return Int(character.asciiValue!) - 65 + 1 + 26
    }
}

func day3part2(input: [String]) -> Int {
    var badges: [Character?] = []
    var currentSet = Set<Character>()
    
    for (index, rucksack) in input.enumerated() {
        if index % 3 == 0 {
            currentSet = Set<Character>(rucksack)
        } else {
            currentSet = currentSet.intersection(Set(rucksack))
        }
        if index % 3 == 2 {
            badges.append(currentSet.first)
        }
    }
    
    return badges.compactMap{$0}.map(scoreItem).reduce(0, +)
}
