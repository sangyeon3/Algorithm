import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<N { arr.append(readLine()!.split(separator: " ").map{ Int($0)! }) }

var start: (y: Int, x: Int) = (-1, -1)
for i in 0..<N {
    for j in 0..<N {
        if arr[i][j] == 9 { start = (i, j) }
    }
}

let moves: [(y: Int, x: Int)] = [(-1, 0), (0, -1), (0, 1), (1, 0)]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var queue = [(y: Int, x: Int, count: Int)]()
var sharkSize = 2
var eatCount = 0

queue.append((start.y, start.x, 0))
visited[start.y][start.x] = true
arr[start.y][start.x] = 0
var ans = 0

while !queue.isEmpty {
    queue.sort(by: { (a, b) -> Bool in
        if a.count == b.count {
            if a.y == b.y { return a.x < b.x }
            return a.y < b.y
        }
        return a.count < b.count
    })
    let f = queue.removeFirst()
    
    if arr[f.y][f.x] != 0 && arr[f.y][f.x] < sharkSize {
        eatCount += 1
        arr[f.y][f.x] = 0
        ans = max(ans, f.count)
        queue.removeAll()
        visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
        visited[f.y][f.x] = true
        
        if eatCount >= sharkSize {
            sharkSize += 1
            eatCount = 0
        }
    }
    
    for move in moves {
        let ny = f.y + move.y, nx = f.x + move.x
        if ny < 0 || nx < 0 || ny >= N || nx >= N || visited[ny][nx] { continue }
        if arr[ny][nx] > sharkSize { continue }
        visited[ny][nx] = true
        queue.append((ny, nx, f.count+1))
    }
}

print(ans)