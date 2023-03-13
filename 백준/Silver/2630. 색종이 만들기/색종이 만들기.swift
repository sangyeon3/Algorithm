import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()

for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var ans = [0, 0]

func sol(_ x: Int, _ y: Int, _ size: Int) {
    if size == 1 {
        ans[arr[x][y]] += 1
        return
    }
    
    for i in 0..<size {
        for j in 0..<size {
            if arr[x+i][y+j] != arr[x][y] {
                sol(x, y, size/2)
                sol(x+size/2, y, size/2)
                sol(x, y+size/2, size/2)
                sol(x+size/2, y+size/2, size/2)
                return
            }
        }
    }
    ans[arr[x][y]] += 1
}

sol(0, 0, N)

print(ans[0])
print(ans[1])