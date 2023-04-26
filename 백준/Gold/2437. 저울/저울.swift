import Foundation

let n = Int(readLine()!)!
let choo = readLine()!.split{ $0 == " " }.map{ Int($0)! }.sorted(by: <)

var max = 1
for i in 0..<n {
    if max < choo[i] {
        break
    }
    max += choo[i]
}
// 1 2 4 7 13 20
print(max)
