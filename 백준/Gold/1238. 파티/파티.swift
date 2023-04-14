import Foundation

struct Heap<T> {
    var heap = [T]()
    let compare: (T, T) -> Bool
    
    var count: Int {
        heap.count - 1
    }
    
    var isEmpty: Bool {
        count == 0
    }

    mutating func insert(_ data: T) {
        if heap.isEmpty {
            heap.append(data)
            heap.append(data)
            return
        }

        var insertedIndex = heap.count
        heap.append(data)

        while insertedIndex > 1 {
            if compare(heap[insertedIndex/2], heap[insertedIndex]) { break }
            heap.swapAt(insertedIndex, insertedIndex/2)
            insertedIndex /= 2
        }
    }
    
    enum moveDownStatus { case none, left, right }

    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let ret = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ idx: Int) -> moveDownStatus {
            let left = idx * 2, right = left + 1
            
            if left >= heap.count {     // 자식 X
                return .none
            }
            if right >= heap.count {    // 왼쪽만
                return compare(heap[left], heap[idx]) ? .left : .none
            }
            
            if compare(heap[idx], heap[left]) && compare(heap[idx], heap[right]) {
                return .none
            }
            if compare(heap[left], heap[idx]) && compare(heap[right], heap[idx]) {
                return compare(heap[left], heap[right]) ? .left : .right
            }
            return compare(heap[left], heap[idx]) ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return ret
            case .left:
                heap.swapAt(poppedIndex, poppedIndex*2)
                poppedIndex = poppedIndex*2
            case .right:
                heap.swapAt(poppedIndex, poppedIndex*2+1)
                poppedIndex = poppedIndex*2+1

            }
        }
    }
}

// Input

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (N, M, X) = (input[0], input[1], input[2])
var relations = [[(node: Int, cost: Int)]](repeating: [(node: Int, cost: Int)](), count: N+1)
for _ in 0..<M {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    relations[input[0]].append((input[1], input[2]))
}

// Solution

var dist = [[Int]](repeating: [Int](repeating: Int.max, count: N+1), count: N+1)

func dijk(_ start: Int) {
    var queue = Heap<(node: Int, cost: Int)> { $0.cost < $1.cost }
    queue.insert((start, 0))
    dist[start][start] = 0
    
    while !queue.isEmpty {
        guard let f = queue.pop() else { break }
        
        for r in relations[f.node] {
            if f.cost + r.cost < dist[start][r.node] {
                dist[start][r.node] = f.cost + r.cost
                queue.insert((r.node, f.cost + r.cost))
            }
        }
    }
}

dijk(X) // 종점에서 모든 정점으로의 최소 경로

var ans = 0
for i in 1...N {
    if i == X { continue }
    
    dijk(i)
    ans = max(ans, dist[i][X] + dist[X][i])
}

print(ans)
