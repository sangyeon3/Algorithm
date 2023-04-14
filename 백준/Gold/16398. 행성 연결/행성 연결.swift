import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<N { arr.append(readLine()!.split{$0==" "}.map{Int($0)!}) }

var edges = [(x: Int, y: Int, cost: Int)]()
for i in 0..<N {
    for j in i+1..<N {
        edges.append((i, j, arr[i][j]))
    }
}

edges.sort{ $0.cost < $1.cost }
var parent = [Int](repeating: -1, count: N)

func find(_ idx: Int) -> Int {
    if parent[idx] == -1 { return idx }
    parent[idx] = find(parent[idx])
    return parent[idx]
}

func union(_ i1: Int, _ i2: Int) {
    let p1 = find(i1), p2 = find(i2)
    if p1 == -1 && p2 != -1 {
        parent[p1] = p2
    } else if p1 != -1 && p2 == -1 {
        parent[p2] = p1
    } else {
        parent[p1] = i2
    }
}

var ans = 0
for i in 0..<edges.count {
    let edge = edges[i]
    if find(edge.x) == find(edge.y) { continue }
    ans += edge.cost
    union(edge.x, edge.y)
}

print(ans)
