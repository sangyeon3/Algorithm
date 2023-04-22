import Foundation

struct Heap<T> {
    var heap = [T]()
    let compare: (T, T) -> Bool
    
    var count: Int {
        heap.count
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    func p(_ cur: Int) -> Int { (cur-1)/2 }
    func l(_ cur: Int) -> Int { cur*2+1 }
    func r(_ cur: Int) -> Int { (cur+1)*2 }
    
    mutating func insert(_ data: T) {
        heap.append(data)
        
        var insertedIndex = heap.count - 1
        while insertedIndex > 0 {
            if compare(heap[insertedIndex], heap[p(insertedIndex)]) {
                heap.swapAt(insertedIndex, p(insertedIndex))
                insertedIndex = p(insertedIndex)
            } else {
                break
            }
        }
    }
    
    mutating func pop() -> T? {
        if isEmpty { return nil }
        
        let ret = heap[0]
        heap.swapAt(0, heap.count-1)
        heap.removeLast()
        
        var poppedIndex = 0
        while r(poppedIndex) < heap.count {
            if compare(heap[l(poppedIndex)], heap[r(poppedIndex)]) {
                if compare(heap[l(poppedIndex)], heap[poppedIndex]) {
                    heap.swapAt(poppedIndex, l(poppedIndex))
                    poppedIndex = l(poppedIndex)
                } else {
                    return ret
                }
            } else {
                if compare(heap[r(poppedIndex)], heap[poppedIndex]) {
                    heap.swapAt(poppedIndex, r(poppedIndex))
                    poppedIndex = r(poppedIndex)
                } else {
                    return ret
                }
            }
        }
        if l(poppedIndex) == heap.count - 1 {
            if compare(heap[l(poppedIndex)], heap[poppedIndex]) {
                heap.swapAt(poppedIndex, l(poppedIndex))
                poppedIndex = l(poppedIndex)
            }
        }
        return ret
    }
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (v, e) = (input[0], input[1])

var relations = [[(node: Int, cost: Int)]](repeating: [(node: Int, cost: Int)](), count: v+1)
for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    relations[input[0]].append((input[1], input[2]))
    relations[input[1]].append((input[0], input[2]))
}

var pq = Heap<(node: Int, cost: Int)>(compare: { $0.cost < $1.cost })
var visited = [Bool](repeating: false, count: v+1)

pq.insert((1, 0))
var ans = 0

while !pq.isEmpty {
    guard let t = pq.pop() else { break }
    if visited[t.node] { continue }
    
    visited[t.node] = true
    ans += t.cost
    for r in relations[t.node] {
        if visited[r.node] { continue }
        pq.insert(r)
    }
}

print(ans)
