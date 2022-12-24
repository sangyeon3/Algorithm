import Foundation

let num = Int(readLine()!)!
var count = 0

for _ in (0..<num) {
    let word = readLine()!
    var prev: [Character: Int] = [:]
    for (index, element) in word.enumerated() {
        if let tmp = prev[element], tmp != index-1 { break }
        prev[element] = index
        if index == word.count-1 { count += 1 }
    }
}

print(count)
