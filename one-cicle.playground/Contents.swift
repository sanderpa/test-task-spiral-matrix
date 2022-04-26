import Cocoa

func generateMatrix(x:Int, y:Int) -> [Array<Int>] {
    let matrix = [[Int]](repeating: [Int](repeating: 0, count: y), count: x)
    return matrix
}

func fillMatrix(m: inout [Array<Int>]) -> [Array<Int>] {
    var num = 0
    var row = 0
    var column = -1
    var direction = 0
    let matrixSize = m.count * m[0].count
    
    while num < matrixSize {
        switch direction {
            case 0:
            if m[row][column+1] == 0 { column+=1 } else {
                direction+=1
                row+=1
            }
            case 1:
            if (row+1 < m.count) && (m[row+1][column] == 0) {  row+=1 } else {
                    direction+=1
                    column-=1
                }
            case 2:
            if m[row][column-1] == 0 { column-=1 } else {
                direction+=1
                row-=1
            }
            case 3:
            if m[row-1][column] == 0 { row-=1 } else {
                direction = 0
                column+=1
            }
            default:
            print("Somesing going wrong")
        }
        num+=1
        m[row][column] = num
    }
    return m
}

var m1 = generateMatrix(x: 7, y: 6)
let result1 = fillMatrix(m: &m1)

for i in result1 {
    print(i)
}
