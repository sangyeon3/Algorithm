import Foundation

var dp = [Int](repeating: 1, count: 101)
for i in 4...100 {
    dp[i] = dp[i-2] + dp[i-3]
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)!
    print(dp[N])
}
