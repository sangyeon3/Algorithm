import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
var children = [[Int]](repeating: [Int](), count: nm[0] + 1)
var indegree = [Int](repeating: 0, count: nm[0] + 1)

for _ in 0..<nm[1] {
    let order = readLine()!.split(separator: " ").map{ Int($0)! }
    for i in 1..<order.count-1 {
        children[order[i]].append(order[i+1])
        indegree[order[i+1]] += 1
    }
}

var queue = [Int]()
for i in 1...nm[0] {
    if indegree[i] == 0 {
        queue.append(i)
    }
}

var ans = [Int]()
while !queue.isEmpty {
    let f = queue.removeLast()
    ans.append(f)
    
    for c in children[f] {
        indegree[c] -= 1
        if indegree[c] <= 0 {
            queue.append(c)
        }
    }
}

if ans.count < nm[0] { print(0) }
else { print(ans.reduce("") { $0 + "\($1)\n" })}
