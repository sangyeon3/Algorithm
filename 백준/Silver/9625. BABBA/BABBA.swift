import Foundation

let k = Int(readLine()!)!
var arr = [1, 0]

for _ in 0..<k {
    let a = arr[1]
    let b = arr[0] + arr[1]
    arr = [a, b]
}

print(arr[0], arr[1])
