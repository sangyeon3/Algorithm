import Foundation

let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (inputs[0], inputs[1])

var relations = [(a: Int, b: Int, cost:Int)]()
for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map{ Int($0)! }
    relations.append((edge[0], edge[1], edge[2]))
}
relations.sort(by: { $0.cost < $1.cost })

var parents = [Int](repeating: 0, count: n+1)

func p(_ a: Int) -> Int {
    if parents[a] == a || parents[a] == 0 { return a }
    parents[a] = p(parents[a])
    return parents[a]
}

func f(_ a: Int, _ b: Int) -> Bool {
    parents[a] = p(a)
    parents[b] = p(b)
    return parents[a] == parents[b]
}

var edgeCount = 0, totalCost = 0, idx = 0

while edgeCount < n-2 {
    let edge = relations[idx]
    idx += 1
    
//    print("edge: \(edge)")
    if f(edge.a, edge.b) { continue }
    
    parents[parents[edge.b]] = parents[edge.a]
//    parents[edge.b] = parents[edge.a]
    edgeCount += 1
    totalCost += edge.cost
}

print(totalCost)

/*
 
 8 7
 1 2 1
 3 4 1
 5 6 1
 7 8 1
 2 4 2
 1 3 3
 1 5 4
 
 답 10
 */
