import Foundation

func parseDay8Input(from file: String) -> Grid<Int> {
    let result = file.components(separatedBy: "\n")
    let numberOfColumns = result[0].count
    
    let gridArray = result.flatMap { $0.map { Int(String($0))! } }
    let grid = Grid(grid: gridArray, width: numberOfColumns)
    
    return grid
}


struct Grid<T> {
    var grid: [T]
    var width: Int
    var height: Int { (grid.count / width) }
    
    init(grid: [T], width: Int) {
        self.grid = grid
        self.width = width
    }
}

extension Grid: CustomStringConvertible where T == Int {
    var description: String {
        var description = ""
        for y in 0..<height {
            let string = grid[y * width..<y * width + width].flatMap { String($0) }
            description.append(contentsOf: string)
            description.append("\n")
        }
        return String(description.dropLast(1))
    }
}
