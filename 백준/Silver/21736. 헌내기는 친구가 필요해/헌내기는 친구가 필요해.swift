import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (nm[0], nm[1])

var arr = [[String]]()
for _ in 0..<n {
    arr.append(readLine()!.map{ String($0) })
}

var start: (y: Int, x: Int) = (-1, -1)

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == "I" {
            start = (i, j)
        }
    }
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var queue = [(y: Int, x: Int)]()
var ans = 0

queue.append(start)
visited[start.y][start.x] = true
var poppedIndex = 0

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

while poppedIndex < queue.count {
    let cur = queue[poppedIndex]
    poppedIndex += 1
    
    for i in 0..<4 {
        let ny = cur.y + dy[i], nx = cur.x + dx[i]
        if ny<0 || nx<0 || ny>=n || nx>=m { continue }
        if visited[ny][nx] || arr[ny][nx] == "X" { continue }
        
        if arr[ny][nx] == "P" { ans += 1 }
        queue.append((ny, nx))
        visited[ny][nx] = true
    }
}

print(ans == 0 ? "TT" : ans)
