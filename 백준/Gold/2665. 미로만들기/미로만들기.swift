import Foundation

let n = Int(readLine()!)!
var arr = [[String]]()
for _ in 0..<n {
    arr.append(readLine()!.map{ String($0) })
}

let moves: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

var state = [[Int]](repeating: [Int](repeating: 10000, count: n), count: n)
var queue = [(y: Int, x: Int)]()

state[0][0] = 0
queue.append((0, 0))

while !queue.isEmpty {
    let f = queue.removeFirst()
    
    for move in moves {
        let ny = f.y + move.y, nx = f.x + move.x
        if ny < 0 || nx < 0 || ny >= n || nx >= n { continue }
        if arr[ny][nx] == "0" && state[ny][nx] > state[f.y][f.x]+1 {
            state[ny][nx] = state[f.y][f.x]+1
            queue.append((ny, nx))
        } else if arr[ny][nx] == "1" && state[ny][nx] > state[f.y][f.x] {
            state[ny][nx] = state[f.y][f.x]
            queue.append((ny, nx))
        }
    }
}

print(state[n-1][n-1])

