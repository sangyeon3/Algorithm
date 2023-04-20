import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
var dict = [String: Bool]()

for _ in 0..<nm[0] {
    dict[readLine()!] = true
}

var count = 0
for _ in 0..<nm[1] {
    if dict[readLine()!] != nil {
        count += 1
    }
}
print(count)
