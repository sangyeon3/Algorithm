import Foundation

let N = Int(readLine()!)!
var arr = [[String]]()
for _ in 0..<N { arr.append(readLine()!.map { String($0) }) }

var ans = ""

func recursion(_ y: Int, _ x: Int, _ size: Int) {
    let color = arr[y][x]
    if size == 1 {
        ans += color
        return
    }
    for i in 0..<size {
        for j in 0..<size {
            if arr[y+i][x+j] != color {
                ans += "("
                recursion(y, x, size/2)
                recursion(y, x+size/2, size/2)
                recursion(y+size/2, x, size/2)
                recursion(y+size/2, x+size/2, size/2)
                ans += ")"
                return
            }
        }
    }
    ans += color
}

recursion(0, 0, N)
print(ans)
