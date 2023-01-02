import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var relations = [[(city: Int, cost: Int)]](repeating: [], count: N+1)
var startToStart = 0
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    relations[input[0]].append((input[1], input[2]))
    if input[0] == input[1] { startToStart = input[2] }
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let start = input[0]
let end = input[1]

if start == end {
    print(startToStart)
    print("1")
    print(start)
}
else {
    var distances: [Int: (cost: Int, prev: Int)] = [:]
    for i in 1...N { distances[i] = (10000000000, -2) }
    distances[start] = (0, -1)
    var isVisited = [Bool](repeating: false, count: N+1)
    var visitCount = 0

    while visitCount < N {
        guard let next = distances.filter({ !isVisited[$0.key] }).min(by: { $0.value.cost < $1.value.cost }) else { break }
        isVisited[next.key] = true
        visitCount += 1
        
        for r in relations[next.key] {
            if (next.value.cost + r.cost) < distances[r.city]!.cost {
                distances[r.city] = ((next.value.cost + r.cost), next.key)
            }
        }
    }

    if var tmp = distances[end] {
        print(tmp.cost)
        var ans: [Int] = [end]
        while tmp.prev != -1 {
            ans.append(tmp.prev)
            tmp = distances[tmp.prev]!
        }
        print(ans.count)
        for i in ans.reversed() { print(i, terminator: " ") }
    }

}
