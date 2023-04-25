import Foundation

let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let (N, M) = (input[0], input[1])

var locations = [(x: Int, y: Int)]()
for _ in 0..<N {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    locations.append((input[0], input[1]))
}

// 거리 계산
var distances = [(n1: Int, n2: Int, distance: Double)]()
for i in 0..<N {
    for j in 0..<N where i < j {
        let dx = Double(locations[i].x - locations[j].x),
            dy = Double(locations[i].y - locations[j].y)
        let d = sqrt(dx*dx + dy*dy)
        
        distances.append((i+1, j+1, d))
    }
}
distances.sort(by: { $0.distance < $1.distance })

// 유니온 파인드
var parent = [Int](repeating: -1, count: N+1)

func find(_ a: Int) -> Int {
    if parent[a] < 0 { return a }
    parent[a] = find(parent[a])
    return parent[a]
}

func union(_ a: Int, _ b: Int) {
    let pa = find(a), pb = find(b)
    if pa == pb { return }
    
    parent[pa] += parent[pb]
    parent[pb] = pa
}

for _ in 0..<M {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    let (a, b) = (input[0], input[1])
    union(a, b)
}

_ = find(1)
if parent[1] == -1*N { print("0.00"); exit(0) }

// pa == -N 이면 끝
var ans = 0.0
for (a, b, distance) in distances {
    let (pa, pb) = (find(a), find(b))
        
    if pa == pb { continue }
    union(a, b)
    ans += distance
    
    if parent[a] == -N { break }
}

print(String(format: "%.2f", ans))
