import Foundation

// Input

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n, m, r) = (input[0], input[1], input[2])
let itemCount = readLine()!.split{$0 == " "}.map{Int($0)!}

var dist = [[Int]](repeating: [Int](repeating: 1000000, count: n+1), count: n+1)
for _ in 0..<r {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    dist[input[0]][input[1]] = input[2]
    dist[input[1]][input[0]] = input[2]
}

// Solution

for i in 1...n {
    dist[i][i] = 0
}

func floyd() {
    for k in 1...n {    // 거쳐가는 노드
        for i in 1...n {
            for j in 1...n {
                dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
            }
        }
    }
}

floyd()

var ans = 0
for i in 1...n {
    var count = 0
    for j in 1...n {
        if dist[i][j] <= m { count += itemCount[j-1] }
    }
    ans = max(ans, count)
}
print(ans)
