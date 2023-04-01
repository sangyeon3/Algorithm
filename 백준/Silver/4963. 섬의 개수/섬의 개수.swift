import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0), (1, 1), (1, -1), (-1, 1), (-1, -1)]

while true {
    let nm = readLine()!.split{$0 == " "}.map{ Int($0)! }
    let h = nm[1], w = nm[0]
    var arr = [[Int]]()
    for _ in 0..<h { arr.append(readLine()!.split{$0==" "}.map{Int($0)!}) }
    
    if nm == [0, 0] { break }
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    var count = 0
    
    for i in 0..<h {
        for j in 0..<w {
            if visited[i][j] { continue }
            visited[i][j] = true
            if arr[i][j] == 0 { continue }
            
            count += 1
            var queue = [(y: Int, x: Int)]([(i, j)])
            var index = 0
            
            while index < queue.count {
                let f = queue[index]
                index += 1
                for move in moves {
                    let ny = f.y + move.y, nx = f.x + move.x
                    if ny < 0 || nx < 0 || ny >= h || nx >= w { continue }
                    if visited[ny][nx] || arr[ny][nx] == 0 { continue }
                    visited[ny][nx] = true
                    queue.append((ny, nx))
                }
            }
        }
    }
    print(count)
}
