import Foundation

func solution(_ n:Int) -> [[Int]] {
    var size = n
    var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    var (y, x) = (0, 0)
    var cur = 1
    while size > 1 {
        for i in 0..<size-1 {
            arr[y][x+i] = cur + i
            arr[y+i][x+size-1] = (size-1) + cur + i
            arr[y+size-1][x+size-1-i] = (size-1)*2 + cur + i
            arr[y+size-1-i][x] = (size-1)*3 + cur + i
        }
        (y, x) = (y+1, x+1)
        cur += (size-1)*4
        size -= 2
    }
    
    if size == 1 {
        arr[y][x] = cur
    }
    
    print(arr.reduce(""){$0 + "\($1)\n"})
    
    return arr
}