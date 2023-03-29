import Foundation

let arr = readLine()!.map { Int(String($0))! }.sorted(by: { $0 > $1 })
print(arr[arr.count-1] == 0 && (arr.reduce(0, +) % 3) == 0 ? arr.reduce("") { String($0) + String($1) } : "-1")
