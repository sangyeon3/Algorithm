import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var relations = [[Int]](repeating: [Int](), count: N)
for i in 0..<N {
    for j in 0..<N {
        if arr[i][j] == 1 {
            relations[i].append(j)
        }
    }
}

for i in 0..<N {
    var queue = [Int]()
    var visited = [Bool](repeating: false, count: N)
    queue.append(i)

    while !queue.isEmpty {
        let f = queue.removeFirst()
        for r in relations[f] {
            if visited[r] { continue }
            arr[i][r] = 1
            queue.append(r)
            visited[r] = true
        }
    }
}

var ans = ""
for i in 0..<N {
    for j in 0..<N {
        ans += String(arr[i][j]) + " "
    }
    ans += "\n"
}
print(ans)
