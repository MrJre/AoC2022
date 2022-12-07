import Foundation

func day7part1(input: FSNode) -> Int {
    return traversePart1(input: input, restriction: 100_000)
}

func traversePart1(input: FSNode, restriction: Int) -> Int {
    var totalSize = 0
    for child in input.children where child is Dir {
        totalSize += traversePart1(input: child, restriction: restriction)
    }
    if input.size <= restriction {
        return input.size + totalSize
    }
    
    return totalSize
}

func day7part2(input: FSNode) -> Int {
    let unused = 70000000 - input.size
    let dif = 30000000 - unused
    
    return traversePart2(input: input, restriction: dif)
}


func traversePart2(input: FSNode, restriction: Int) -> Int {
    var totalSize = input.size
    for child in input.children where child is Dir {
        if child.size >= restriction {
            totalSize = min(totalSize, traversePart2(input: child, restriction: restriction))
        }
    }
    
    return totalSize
}
