import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

func bfs() -> [(y: Int, x: Int)] {
    var queue = [(y: Int, x: Int)]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    var count = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var melting = [(y: Int, x: Int)]()
    
    queue.append((0, 0))
    visited[0][0] = true
    
    while !queue.isEmpty {
        let f = queue.removeLast()
        for move in moves {
            let ny = move.y + f.y, nx = move.x + f.x
            if ny<0 || nx<0 || ny>=n || nx>=m || visited[ny][nx] { continue }
            
            if arr[ny][nx] == 1 {
                count[ny][nx] += 1
                if count[ny][nx] == 2 {
                    melting.append((ny, nx))
                }
            } else {
                visited[ny][nx] = true
                queue.append((ny, nx))
            }
        }
    }
    
    return melting
}

var ans = 0

while true {
    let melting = bfs()
    if melting.isEmpty {
        break
    }
    
    for m in melting {
        arr[m.y][m.x] = 0
    }
    ans += 1
}

print(ans)
