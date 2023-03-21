import Foundation

struct Queue<T> {
    private var queue = [T?]()
    private var index = 0
    
    var count: Int {
        queue.count - index
    }
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    mutating func push(_ data: T) {
        queue.append(data)
    }
    
    mutating func pop() -> T? {
        guard index < queue.count, let ret = queue[index] else {
            return nil
        }
        queue[index] = nil
        index += 1
        
        if index > 5000 {
            queue.removeFirst(index)
            index = 0
        }
        
        return ret
    }
}

func read2Int() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

let (N, M) = read2Int()
var relations = [[Int]](repeating: [Int](), count: N+1)

for _ in 0..<M {
    let (a, b) = read2Int()
    relations[a].append(b)
    relations[b].append(a)
}

var count = [Int](repeating: 0, count: N)

for i in 1...N {
    var visited = [Bool](repeating: false, count: N+1)
    
    var queue = Queue<Int>()
    queue.push(i)
    visited[i] = true
    
    var length = [Int](repeating: 0, count: N+1)
    while !queue.isEmpty {
        guard let f = queue.pop() else { break }
        
        for r in relations[f] {
            if visited[r] { continue }
            visited[r] = true
            length[r] = length[f] + 1
            count[i-1] += length[f] + 1
            queue.push(r)
        }
    }
}

print(count.enumerated().min { $0.element < $1.element }.map { $0.offset + 1 }!)
