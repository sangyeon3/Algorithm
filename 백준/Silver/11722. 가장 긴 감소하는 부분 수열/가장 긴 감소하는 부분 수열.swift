import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

if N == 1 {
    print(1)
    exit(0)
}

var dp = [Int](repeating: 1, count: N)
var ans = 1
for i in 1..<N {
    for j in 0..<i {
        if arr[i] < arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
            ans = max(ans, dp[i])
        }
    }
}
print(ans)
