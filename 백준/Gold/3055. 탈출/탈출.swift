import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (r, c) = (input[0], input[1])

var arr = [[String]]()
var start: (y: Int, x: Int) = (-1, -1)
var end: (y: Int, x: Int) = (-1, -1)

var waterTime = [[Int]](repeating: [Int](repeating: 1000000, count: c), count: r)
var waterQueue = [(y: Int, x: Int)]()

for i in 0..<r {
    arr.append(readLine()!.enumerated().map{
        let t = String($0.element)
        if t == "S" {
            start = (i, $0.offset)
        } else if t == "D" {
            end = (i, $0.offset)
        } else if t == "*" {
            waterQueue.append((i, $0.offset))
            waterTime[i][$0.offset] = 0
        }
        return t
    })
}

// 물 시간
while !waterQueue.isEmpty {
    let f = waterQueue.removeFirst()
    for move in moves {
        let nx = move.x + f.x, ny = move.y + f.y
        if ny<0 || nx<0 || ny>=r || nx>=c { continue }
        if arr[ny][nx] == "X" || arr[ny][nx] == "D" { continue }
        if waterTime[ny][nx] != 1000000 { continue }
        
        waterTime[ny][nx] = waterTime[f.y][f.x] + 1
        waterQueue.append((ny, nx))
    }
}

// 고슴도치
var visit = [[Int]](repeating: [Int](repeating: 1000000, count: c), count: r)
var queue = [(y: Int, x: Int)]()

queue.append(start)
visit[start.y][start.x] = 0

while !queue.isEmpty {
    let f = queue.removeFirst()
    
    for move in moves {
        let nx = move.x + f.x, ny = move.y + f.y
        if ny<0 || nx<0 || ny>=r || nx>=c { continue }
        if arr[ny][nx] == "X" { continue }
        if visit[ny][nx] > visit[f.y][f.x] + 1 && waterTime[ny][nx] > visit[f.y][f.x] + 1 {
            visit[ny][nx] = visit[f.y][f.x] + 1
            queue.append((ny, nx))
        }
    }
}

if visit[end.y][end.x] == 1000000 {
    print("KAKTUS")
} else {
    print(visit[end.y][end.x])
}
