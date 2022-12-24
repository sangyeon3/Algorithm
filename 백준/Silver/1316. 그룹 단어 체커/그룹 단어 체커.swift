import Foundation

let num = Int(readLine()!)!
var count = 0

for _ in (0..<num) {
    let word = readLine()!
    var prev: [Character: Int] = [:]
    var flag = true
    word.enumerated().forEach { (index, element) in
        if let prev = prev[element], prev != index-1 {
            flag = false
            return
        }
        prev[element] = index
    }
    if flag { count += 1 }
}

print(count)
