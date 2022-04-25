import Cocoa

func generateSpiralMatrix(x:Int, y:Int) -> [Array<Int>] {
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: y), count: x)
    var counter = 1
    var startColumn = 0
    var endColumn = y - 1
    var startRow = 0
    var endRow = x - 1
    
    while (startColumn < endColumn) && (startRow <= endRow) {
        
        for i in stride(from: startColumn, through: endColumn, by: 1){
            matrix[startRow][i] = counter
            counter+=1
            if counter > x { counter = 1 }
        }
        startRow+=1
        
        for j in stride(from: startRow, through: endRow, by: 1){
            if matrix[j][endColumn] == 0 {
            matrix[j][endColumn] = counter
            counter+=1
            if counter > x { counter = 1 }
            }
        }
        endColumn-=1
        
        for m in stride(from: endColumn, through: startColumn, by: -1){
            matrix[endRow][m] = counter
            counter+=1
            if counter > x { counter = 1 }
        }
        endRow-=1
        
        for n in stride(from: endRow, through: startRow, by: -1){
            matrix[n][startColumn] = counter
            counter+=1
            if counter > x { counter = 1 }
        }
        startColumn+=1
    }
    return matrix
}

let m1 = generateSpiralMatrix(x: 100, y: 100)

for i in m1 {
    print(i)
}
