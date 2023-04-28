import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, l) = (input[0], input[1])

var arr = [[Int]]()
var flippedArr = [[Int]](repeating: [Int](), count: n)

for i in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{Int($0)!})
    for j in 0..<n {
        flippedArr[j].append(arr[i][j])
    }
}


func count(_ arr: [[Int]]) -> Int {
    var ans = 0

    for i in 0..<n {
        var j = 0
        var visited = [Bool](repeating: false, count: n)
        var state = true

        while j < n-1 {
            let diff = arr[i][j] - arr[i][j+1]
            if diff == 0 {
                j += 1
            } else if diff == 1 {
                if j+l >= n { state = false; break }
                
                for k in j+1...j+l {
                    if arr[i][k] != arr[i][j+1] || visited[k] { state = false; break }
                    visited[k] = true
                }
                
                if state { j += l }
                else { break }
                
            } else if diff == -1 {
                if j-l+1 < 0 { state = false; break }
                for k in j-l+1...j {
                    if arr[i][k] != arr[i][j] || visited[k] { state = false; break }
                    visited[k] = true
                }
                
                if state { j += 1 }
                else { break }
                
            } else {
                state = false
                break
            }
        }

        if state {
            ans += 1
        }
    }

    return ans
}

print(count(arr) + count(flippedArr))
