import Foundation

let N = Int(readLine()!)!
var A = (readLine()!).split(separator: " ").map { Int($0)! }
var B = (readLine()!).split(separator: " ").map { Int($0)! }

A.sort(by: { $0 < $1 })
B.sort(by: { $0 > $1 })

var ans = 0
for i in 0..<N {
    ans += A[i] * B[i]
}
print(ans)
