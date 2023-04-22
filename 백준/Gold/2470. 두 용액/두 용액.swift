import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

var i = 0, j = arr.count-1
var minSum = 2000000000
var ans = [Int]()
var sum = 0
while i < j {
    sum = arr[i] + arr[j]
    if minSum > abs(sum) {
        minSum = abs(sum)
        ans = [arr[i], arr[j]]
    }
    
    if sum > 0 {
        j -= 1
    } else {
        i += 1
    }
}

print(ans.reduce(""){ $0 + "\($1) "})
