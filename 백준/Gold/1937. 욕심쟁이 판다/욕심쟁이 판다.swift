import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

let n = Int(readLine()!)!

var arr = [[Int]]()
var locations = [(y: Int, x: Int, amount: Int)]()
for i in 0..<n {
    arr.append(readLine()!.split(separator: " ").enumerated().map{
        let amount = Int($0.element)!
        locations.append((i, $0.offset, amount))
        return amount
    })
}

locations.sort{ $0.amount < $1.amount }

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

func dfs(_ y: Int, _ x: Int) {
    dp[y][x] = 1
    var tmp = 0
    for move in moves {
        let nx = move.x + x, ny = move.y + y
        if ny<0 || nx<0 || ny>=n || nx>=n { continue }
        if visited[ny][nx] || arr[ny][nx] <= arr[y][x] { continue }
        
        if dp[ny][nx] == 0 {
            visited[ny][nx] = true
            dfs(ny, nx)
            visited[ny][nx] = false
        }
        tmp = max(tmp, dp[ny][nx])
    }
    dp[y][x] += tmp
}

var ans = 0
for location in locations {
    if dp[location.y][location.x] != 0 { continue }
    
    visited[location.y][location.x] = true
    dfs(location.y, location.x)
    visited[location.y][location.x] = false
    ans = max(ans, dp[location.y][location.x])
}

print(ans)
