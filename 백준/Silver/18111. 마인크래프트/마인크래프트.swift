import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], M = input[1]
var heightCount: [Int: Int] = [:]

for _ in 0..<N {
    let _ = readLine()!.split(separator: " ").map{
        let height = Int($0)!
        heightCount[height] = (heightCount[height] ?? 0) + 1
    }
}
let sorted = heightCount.sorted(by: { $0.key < $1.key })

var blockCount = input[2]
var spendTime = 0
let minHeight = sorted.first!.key

for h in sorted {
    let diff = h.key - minHeight
    blockCount += diff * h.value
    spendTime += diff * h.value * 2
}
var ans: (time: Int, height: Int) = (spendTime, minHeight)

var index = 0
var prevHeight = minHeight
var prevCount = 0

for i in minHeight...256 {
    if index >= sorted.count { break }
    let diff = i - prevHeight
    prevHeight = i
    
    spendTime -= (diff) * (N*M-prevCount) * 2
    blockCount -= (diff) * (N*M-prevCount)
    blockCount -= diff * prevCount
    if blockCount < 0 {
        break
    }
    spendTime += diff * prevCount
    if ans.time >= spendTime {
        ans = (spendTime, i)
    }
    if i == sorted[index].key {
        prevCount += sorted[index].value
        index += 1
    }
}
print("\(ans.time) \(ans.height)")
