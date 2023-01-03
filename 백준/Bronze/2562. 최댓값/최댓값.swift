import Foundation

var arr = [Int](repeating: 0, count: 9)
for i in 0..<9 {
    arr[i] = Int(readLine()!)!
}
let ans = arr.enumerated().max(by: { $0.element < $1.element })!
print(ans.element)
print(ans.offset + 1)
