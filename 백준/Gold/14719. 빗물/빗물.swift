import Foundation

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (H, W) = (input[0], input[1])
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var diff = 0
for i in 1...H {
    let indexes = arr.enumerated().filter{ $0.element >= i }.map { $0.offset }
    if indexes.count <= 1 { continue }
    var prev = indexes[0]
    for j in 1..<indexes.count {
        diff += indexes[j] - prev - 1
        prev = indexes[j]
    }
}
print(diff)
