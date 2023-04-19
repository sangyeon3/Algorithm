import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (R, C) = (input[0], input[1])
var cave = [[String]]()
for _ in 0..<R {
    cave.append(readLine()!.map{String($0)})
}

let N = Int(readLine()!)!
var isLeft = true
var visited = [[Int]]()
var mark = 1

func bfs(_ y: Int, _ x: Int, _ mark: Int) -> [(y: Int, x: Int)] {
    var queue = [(y: Int, x: Int)]()
    queue.append((y, x))
    visited[y][x] = mark
    var index = 0
   
    while index < queue.count {
        let f = queue[index]
       
        for move in moves {
            let ny = f.y + move.y, nx = f.x + move.x
            if ny < 0 || nx < 0 || ny >= R || nx >= C { continue }
            if cave[ny][nx] == "." || visited[ny][nx] != 0 { continue }
           
            queue.append((ny, nx))
            visited[ny][nx] = mark
        }
        index += 1
    }
    return queue
}

func downCluster() {
    visited = [[Int]](repeating: [Int](repeating: 0, count: C), count: R)
    var state = false
   
    for i in stride(from: R-1, to: -1, by: -1) {
        for j in 0..<C {
            if cave[i][j] == "x" && visited[i][j] == 0 {
                let toUpdated = bfs(i, j, mark)
                
                if i != R-1 {
                    state = true

                    var height = R-i-1
                    for coor in toUpdated {
                        cave[coor.y][coor.x] = "."
                        for k in (coor.y+1)..<R {
                            if cave[k][coor.x] == "x" && visited[k][coor.x] != mark {
                                height = min(height, k-(coor.y)-1)
                            }
                        }
                    }
                   
                    for coor in toUpdated {
//                        cave[coor.y][coor.x] = "."
                        cave[coor.y + height][coor.x] = "x"
                    }
                    break
                }
                mark += 1
            }
        }
        if state { break }
    }
}

let sticks = readLine()!.split(separator: " ").map{Int($0)!}
for stick in sticks {
   
    let r = R-stick
    if isLeft {
        if let index = cave[r].firstIndex(of: "x") {
            cave[r][index] = "."
        }
    } else {
        if let index = cave[r].lastIndex(of: "x") {
            cave[r][index] = "."
        }
    }
   
    isLeft = !isLeft
    downCluster()
}

var ans = ""
cave.forEach{
    c in ans += c.reduce("") {$0 + "\($1)"}
    ans += "\n"
}
ans.removeLast()
print(ans)