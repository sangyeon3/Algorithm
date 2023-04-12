import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
var ans = 0
var min = arr[0]
for i in 1..<N {
    if min < arr[i] { ans = max(ans, arr[i]-min) }
    else {
        min = arr[i]
    }
}
print(ans)
