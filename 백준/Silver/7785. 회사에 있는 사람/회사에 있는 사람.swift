import Foundation

let N = Int(readLine()!)!
var log = [[String]]()
for _ in 0..<N { log.append((readLine()!).split(separator: " ").map { String ($0) }) }

log.sort(by: {
    if $0[0] > $1[0] { return true }
    else if $0[0] == $1[0] && $0[1] < $1[1] { return true }
    return false
})
var ans: [String] = []
for i in 0..<N {
    if log[i][1] == "enter" { ans.append(log[i][0]) }
    else { ans.removeLast() }
}
ans.forEach { print($0) }
