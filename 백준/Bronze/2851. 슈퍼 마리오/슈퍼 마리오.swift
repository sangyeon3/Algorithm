import Foundation

var arr = [Int]()
for _ in 0..<10 { arr.append(Int(readLine()!)!) }
var (sum, prev) = (0, 0)
for i in 0..<10 {
    sum += arr[i]
    if sum > 100 {
        sum = 100 - prev >= sum - 100 ? sum : prev
        break
    }
    prev = sum
}
print(sum)
