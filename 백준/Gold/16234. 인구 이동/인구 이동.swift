import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (N, L, R) = (input[0], input[1], input[2])
var arr = [[Int]]()
for _ in 0..<N { arr.append(readLine()!.split{$0 == " "}.map{Int($0)!}) }

var arrToUpdate = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
var visited = [[Bool]]()
var isMoved = false

func bfs(_ y: Int, _ x: Int) {
    var queue = [(y: Int, x: Int)]()
    queue.append((y, x))
    visited[y][x] = true
    var frontIndex = 0
    var sum = arr[y][x]
    
    while frontIndex < queue.count {
        let f = queue[frontIndex]
        frontIndex += 1
        
        for move in moves {
            let ny = f.y + move.y, nx = f.x + move.x
            if ny < 0 || nx < 0 || ny >= N || nx >= N || visited[ny][nx] { continue }
            
            // 인구 비교
            let diff = abs(arr[f.y][f.x] - arr[ny][nx])
            if !(L...R ~= diff) { continue }
            
            visited[ny][nx] = true
            queue.append((ny, nx))
            sum += arr[ny][nx]
        }
    }
    
    var newPopulation = sum / queue.count
    for (i, j) in queue {
        arrToUpdate[i][j] = newPopulation
    }
    if queue.count > 1 {
        isMoved = true
    }
}

var moveDay = 0
while true {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    isMoved = false
    for i in 0..<N {
        for j in 0..<N {
            if visited[i][j] { continue }
            bfs(i, j)
        }
    }
    arr = arrToUpdate
    if !isMoved { break }
    moveDay += 1
}

print(moveDay)
