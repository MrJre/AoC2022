import Foundation

func parseDay9Input(from file: String) -> [Move] {
    let result = file.components(separatedBy: "\n")
    let moves: [Move] = result.filter { $0.count > 0 }.map {
        let move = $0.components(separatedBy: " ")
        let direction: Point
        
        switch move[0] {
            case "L": direction = Point(x: -1, y: 0)
            case "U": direction = Point(x: 0, y: 1)
            case "R": direction = Point(x: 1, y: 0)
            case "D": direction = Point(x: 0, y: -1)
            default: fatalError()
        }
        
        return Move(amount: Int(move[1])!, direction: direction)
    }
    return moves
}

struct Move {
    let amount: Int
    let direction: Point
}

struct Point {
    let x: Int
    let y: Int
}
extension Point: Hashable {}
extension Point {
    static func +(left: Point, right: Point) -> Point {
        Point(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func -(left: Point, right: Point) -> Point {
        Point(x: left.x - right.x, y: left.y - right.y)
    }
}
