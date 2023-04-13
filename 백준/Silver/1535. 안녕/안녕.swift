import Foundation

let N = Int(readLine()!)!
let health = readLine()!.split{$0 == " "}.map{Int($0)!}
let joy = readLine()!.split{$0 == " "}.map{Int($0)!}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 100), count: N+1)

for i in 0..<N {
    for h in 0..<100 {
        if h < health[i] {
            dp[i+1][h] = dp[i][h]
        } else {
            dp[i+1][h] = max(dp[i][h-health[i]] + joy[i], dp[i][h])
        }
    }
}

print(dp[N][99])
