import Foundation

func day9part1(input: [Move]) -> Int {
    visits(given: input, numberOfKnots: 2)
}

func day9part2(input: [Move]) -> Int {
    visits(given: input, numberOfKnots: 10)
}

func visits(given moves: [Move], numberOfKnots: Int) -> Int {
    var visited: Set<Point> = [Point(x: 0, y: 0)]
    var knots = Array(repeating: Point(x: 0, y: 0), count: numberOfKnots)
    
    for move in moves {
        for _ in 1...move.amount {
            knots[0] = knots[0] + move.direction
            for current in 1..<knots.count {
                knots[current] = moveTailOneStep(from: knots[current], given: knots[current-1])
            }
            visited.insert(knots.last!)
        }
    }
    return visited.count
}

func moveTailOneStep(from origin: Point, given head: Point) -> Point {
    let delta = head - origin
    let result = origin + Point(x: delta.x.signum(), y: delta.y.signum())
    return result == head ? origin : result
}
