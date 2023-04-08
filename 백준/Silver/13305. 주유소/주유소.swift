import Foundation

let N = Int(readLine()!)!
var distances = readLine()!.split(separator: " ").map { Int($0)! }
var prices = readLine()!.split(separator: " ").map { Int($0)! }

var minPrice = prices[0]
var ans = minPrice * distances[0]

for i in 1..<N-1 {
    minPrice = min(minPrice, prices[i])
    ans += minPrice * distances[i]
}

print(ans)
