import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<N {
    arr.append(readLine()!.split{$0 == " "}.map{ Int($0)! })
}

let moves = [(0, 1), (1, 0)]
var queue = [(y: Int, x: Int)]([(0, 0)])
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
visited[0][0] = true
var state = false

while !queue.isEmpty && !state {
    let f = queue.removeFirst()
    if arr[f.y][f.x] == -1 {
        state = true
        break
    }
    
    for move in moves {
        let nx = f.x + move.1 * arr[f.y][f.x], ny = f.y + move.0 * arr[f.y][f.x]
        if nx < 0 || ny < 0 || nx >= N || ny >= N || visited[ny][nx] { continue }
        visited[ny][nx] = true
        queue.append((ny, nx))
    }
}
if state { print("HaruHaru") }
else { print("Hing") }
