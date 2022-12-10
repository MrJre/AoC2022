import Foundation

func day8part1(input: Grid<Int>) -> Int {
    let grid = makeVisibilityGrid(for: input)
    return grid.grid.filter { $0 == 1 }.reduce(0, +)
}

func makeVisibilityGrid(for grid: Grid<Int>) -> Grid<Int> {
    var result = grid
    for y in 0..<grid.height {
        for x in 0..<grid.width {
            let isVisible = isGridpointVisible(grid: grid, x: x, y: y)
            result.grid[y * grid.width + x] = isVisible ? 1 : 0
        }
    }
    
    print(result)
    
    return result
}

func isGridpointVisible(grid: Grid<Int>, x: Int, y: Int) -> Bool {
    let left = isVisibleFromWest(grid: grid, x: x, y: y).0
    let right = visibilityFromEast(grid: grid, x: x, y: y).0
    let up = visibilityFromNorth(grid: grid, x: x, y: y).0
    let down = visibilityFromSouth(grid: grid, x: x, y: y).0

    return left || right || up || down
}

func isVisibleFromWest(grid: Grid<Int>, x: Int, y: Int) -> (Bool, Int) {
    let point = grid.grid[y * grid.width + x]
    var visibility = 0
    for xPos in stride(from: x - 1, to: 0, by: -1) {
        visibility += 1
        if grid.grid[y * grid.width + xPos] >= point {
            return (false, visibility)
        }
    }
    return (true, visibility)
}

func visibilityFromNorth(grid: Grid<Int>, x: Int, y: Int) -> (Bool, Int) {
    let point = grid.grid[y * grid.width + x]
    var visibility = 0
    for yPos in stride(from: y - 1, to: 0, by: -1) {
        visibility += 1
        if grid.grid[yPos * grid.width + x] >= point {
            return (false, visibility)
        }
        
    }
    return (true, visibility)
}

func visibilityFromSouth(grid: Grid<Int>, x: Int, y: Int) -> (Bool, Int) {
    let point = grid.grid[y * grid.width + x]
    var visibility: Int = 0
    for yPos in y+1..<grid.height {
        visibility += 1
        print(yPos, grid.grid[yPos * grid.width + x])
        if grid.grid[yPos * grid.width + x] >= point {
            return (false, visibility)
        }
        
    }
    return (true, visibility)
}



func visibilityFromEast(grid: Grid<Int>, x: Int, y: Int) -> (Bool, Int) {
    let point = grid.grid[y * grid.width + x]
    var visibility = 0
    for xPos in x+1..<grid.width {
        visibility += 1
        if grid.grid[y * grid.width + xPos] >= point {
            return (false, visibility)
        }
    }
    return (true, visibility)
}








func day8part2(input: Grid<Int>) -> Int {
    let grid = makeScenicGrid(for: input)
    return grid.grid.reduce(0) { max($0, $1) }
}

func makeScenicGrid(for grid: Grid<Int>) -> Grid<Int> {
    var result = grid
    for y in 0..<grid.height {
        for x in 0..<grid.width {
//            result.grid[y * grid.width + x] = scenicScoreForGridpoint(grid: grid, x: x, y: y)
        }
    }

    print(result)
    
    return result
}

func scenicScoreForGridpoint(grid: Grid<Int>, x: Int, y: Int) -> Int {
    let left = isVisibleFromWest(grid: grid, x: x, y: y).1
    let right = visibilityFromEast(grid: grid, x: x, y: y).1
    let up = visibilityFromNorth(grid: grid, x: x, y: y).1
    let down = visibilityFromSouth(grid: grid, x: x, y: y).1
    
    return [up, left, down, right].reduce(1, *)
}

