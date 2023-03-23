import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()

for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var ans = [Int](repeating: 0, count: 3)

func recursion(_ y: Int, _ x: Int, _ size: Int) {
    let number = arr[y][x]
    
    if size == 1 {
        ans[number + 1] += 1
        return
    }
    
    for i in 0..<size {
        for j in 0..<size {
            if arr[y+i][x+j] != number {
                recursion(y, x, size/3)
                recursion(y+size/3, x, size/3)
                recursion(y, x+size/3, size/3)
                recursion(y+size/3, x+size/3, size/3)
                recursion(y+size/3, x+(size/3)*2, size/3)
                recursion(y+(size/3)*2, x+size/3, size/3)
                recursion(y+(size/3)*2, x, size/3)
                recursion(y, x+(size/3)*2, size/3)
                recursion(y+(size/3)*2, x+(size/3)*2, size/3)
                return
            }
        }
    }
    
    ans[number + 1] += 1
}

recursion(0, 0, N)

for i in 0..<3 {
    print(ans[i])
}
