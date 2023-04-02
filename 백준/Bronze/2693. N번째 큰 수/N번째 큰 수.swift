import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    arr.sort(by: >)
    print(arr[2])
}
