import Foundation

struct Queue<T> {
    var queue = [T?]()
    var index = 0
    
    var count: Int {
        queue.count - index
    }
    
    var isEmpty: Bool {
        count == 0
    }
    
    mutating func push(_ data: T) {
        queue.append(data)
    }
    
    mutating func pop() -> T? {
        if isEmpty { return nil }
        
        let ret = queue[index]
        queue[index] = nil
        index += 1
        
        if index > 100 {
            queue.removeFirst(index)
            index = 0
        }
        return ret
    }
}

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
    var queue = Queue<Int>()
    var visited = [Bool](repeating: false, count: N)
    queue.push(i)

    while !queue.isEmpty {
        guard let f = queue.pop() else { break }
        for r in relations[f] {
            if visited[r] { continue }
            arr[i][r] = 1
            queue.push(r)
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
