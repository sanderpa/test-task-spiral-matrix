import Cocoa

func generateMatrix(x:Int, y:Int) -> [Array<Int>] {
    let matrix = [[Int]](repeating: [Int](repeating: 0, count: y), count: x)
    return matrix
}

func isEmpty(m: [Array<Int>], x: Int, y: Int) -> Bool {
    if x < 0 { return false}
    if x > m.count - 1 { return false}
    if (y < 0) { return false}
    if y > m[0].count - 1 {return false}
    else{ return m[x][y] == 0}
}

func switchDirection(dx: Int, dy: Int) -> (Int, Int) {
    if (dx == 0) && (dy == 1) { return (1, 0) }
    if (dx == 1) && (dy == 0) { return (0, -1) }
    if (dx == 0) && (dy == -1) { return (-1, 0) }
    else {return (0, 1)}
}

func recursiveFill (m: inout [Array<Int>], currentV: Int = 1, x: Int = 0, y: Int = 0, dx: Int = 0, dy: Int = 1) -> [Array<Int>] {
    if !isEmpty(m: m, x: x, y: y) {return m}
    
    m[x][y] = currentV
        
    let nextV = currentV + 1
    let isNextEmpty = isEmpty(m: m, x: x+dx, y: y+dy)
    let (nextDx, nextDy) = isNextEmpty ? (dx, dy) : switchDirection(dx: dx, dy: dy)
    let (nextX, nextY) = (x + nextDx, y + nextDy)

    return recursiveFill(m: &m, currentV: nextV, x: nextX, y: nextY, dx: nextDx, dy: nextDy)
    
}

// Edit here the dimension of the matrix
var m1 = generateMatrix(x: 10, y: 10)
let result1 = recursiveFill(m: &m1)

// This loop is used to print a matrix to a column
for i in result1 {
    print(i)
}

