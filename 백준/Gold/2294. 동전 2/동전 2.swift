import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, k) = (input[0], input[1])

var coins = [Int]()
var dp = [Int](repeating: -1, count: 10001)

for _ in 0..<n {
    let a = Int(readLine()!)!
    coins.append(a)
    if a < 10001 { dp[a] = 1 }
}

for i in 1...k {
    if dp[i] != -1 { continue }
    for coin in coins {
        if (i - coin) < 1 || dp[i-coin] == -1 { continue }
        
        if dp[i] == -1 { dp[i] = dp[i-coin] + 1 }
        else { dp[i] = min(dp[i], dp[i-coin] + 1) }
    }
}

print(dp[k])
