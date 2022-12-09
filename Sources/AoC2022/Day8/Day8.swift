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
    let left = visibilityFromWest(grid: grid, x: x, y: y)
    let right = visibilityFromEast(grid: grid, x: x, y: y)
    let up = visibilityFromNorth(grid: grid, x: x, y: y)
    let down = visibilityFromSouth(grid: grid, x: x, y: y)
    
    let visibleFromWest = left == x
    let visibleFromEast = right == (grid.width - 1) - x
    let visibleFromNorth = up == y
    let visibleFromSouth = down == (grid.height - 1) - y

    let point = grid.grid[y * grid.width + x]
    
    print("(\(x),\(y)) = \(point) --", "up: \(up)", "left: \(left)", "down: \(down)", "right: \(right)", "--", visibleFromNorth, visibleFromWest, visibleFromSouth, visibleFromEast)
    

    
    return visibleFromWest || visibleFromEast || visibleFromNorth || visibleFromSouth
}

func day8part2(input: Grid<Int>) -> Int {
    let grid = makeScenicGrid(for: input)
    return grid.grid.reduce(0) { max($0, $1) }
}

func makeScenicGrid(for grid: Grid<Int>) -> Grid<Int> {
    var result = grid
    for y in 0..<grid.height {
        for x in 0..<grid.width {
            result.grid[y * grid.width + x] = scenicScoreForGridpoint(grid: grid, x: x, y: y)
        }
    }

    return result
}

func scenicScoreForGridpoint(grid: Grid<Int>, x: Int, y: Int) -> Int {
    let left = visibilityFromWest(grid: grid, x: x, y: y)
    let right = visibilityFromEast(grid: grid, x: x, y: y)
    let up = visibilityFromNorth(grid: grid, x: x, y: y)
    let down = visibilityFromSouth(grid: grid, x: x, y: y)
    
    return [up, left, down, right].reduce(1, *)
}

func visibilityFromNorth(grid: Grid<Int>, x: Int, y: Int) -> Int {
    let point = grid.grid[y * grid.width + x]
    var yPos = y
    var visibility = 0
    while yPos > 0 {
        yPos -= 1
        
        if grid.grid[yPos * grid.width + x] < point {
            visibility += 1
        }
        
    }
    return visibility
}

func visibilityFromSouth(grid: Grid<Int>, x: Int, y: Int) -> Int {
    let point = grid.grid[y * grid.width + x]
    var yPos = y
    var visibility: Int = 0
    while yPos < grid.height - 1 {
        yPos += 1
        
        if grid.grid[yPos * grid.width + x] < point {
            visibility += 1
        }
    }
    return visibility
}

func visibilityFromWest(grid: Grid<Int>, x: Int, y: Int) -> Int {
    let point = grid.grid[y * grid.width + x]
    var xPos = x
    var visibility = 0
    while xPos > 0 {
        xPos -= 1
        if grid.grid[y * grid.width + xPos] < point {
            visibility += 1
        }
    }
    return visibility
}

func visibilityFromEast(grid: Grid<Int>, x: Int, y: Int) -> Int {
    let point = grid.grid[y * grid.width + x]
    var visibility = 0
    for xPos in x..<grid.width {
        if grid.grid[y * grid.width + xPos] < point {
            visibility += 1
        }
    }
    return visibility
}

