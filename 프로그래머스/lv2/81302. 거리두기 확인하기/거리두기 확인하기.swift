import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
let diag: [(y: Int, x: Int)] = [(-1, 1), (1, 1), (1, -1), (-1, -1)]

func solution(_ places:[[String]]) -> [Int] {
    
    var ans = [Int]()
    for place in places {
        let arr = place.map{ str in str.map{String($0)} }
        var state = true
        for y in 0..<5 {
            for x in 0..<5 {
                if arr[y][x] != "P" { continue }
                // length 1
                for move in moves {
                    var ny = y + move.y, nx = x + move.x
                    if ny < 0 || nx < 0 || ny >= 5 || nx >= 5 { continue }
                    if arr[ny][nx] == "P" { 
                        state = false
                        ans.append(0)
                        break
                    } 

                    let nny = ny + move.y, nnx = nx + move.x
                    if nny < 0 || nnx < 0 || nny >= 5 || nnx >= 5 { continue }
                    if arr[nny][nnx] == "P" && arr[ny][nx] != "X" {
                        state = false
                        ans.append(0)
                        break
                    }
                }
                if !state {break}

                // length 2, 대각선
                for d in diag {
                    let ny = y + d.y, nx = x + d.x
                    if ny < 0 || nx < 0 || ny >= 5 || nx >= 5 { continue }
                    if arr[ny][nx] == "P" && (arr[y][nx] != "X" || arr[ny][x] != "X") { 
                        state = false
                        ans.append(0)
                        break
                    }
                }
                if !state { break }
            }
            if !state { break }
        }
        if state { ans.append(1) }
    }
    
    return ans
}