import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var problemNumber = 0
while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    problemNumber += 1
    
    var arr = [[Int]]()
    for _ in 0..<n {
        arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    
    var dp = [[Int]](repeating: [Int](repeating: 400000, count: n), count: n)
    
    func bfs() {
        var queue = [(y: Int, x: Int)]()
        queue.append((0, 0))
        dp[0][0] = arr[0][0]
        
        while !queue.isEmpty {
            let f = queue.removeFirst()
            
            for move in moves {
                let ny = move.y + f.y, nx = move.x + f.x
                if ny<0 || nx<0 || ny>=n || nx>=n { continue }
                if dp[ny][nx] <= dp[f.y][f.x] + arr[ny][nx] { continue }
                
                dp[ny][nx] = dp[f.y][f.x] + arr[ny][nx]
                queue.append((ny, nx))
            }
        }
    }
    
    bfs()
    print("Problem \(problemNumber): \(dp[n-1][n-1])")
}
