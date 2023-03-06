import Foundation

struct MinHeap {
    typealias T = (cost: Int, node: Int)
    
    var heap = [T]()
    
    func isEmpty() -> Bool {
        heap.count <= 1
    }
    
    mutating func insert(_ data: T) {
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
            return
        }
        
        var insertedIndex = heap.count
        heap.append(data)
        
        func isMoveUp(_ index: Int) -> Bool {
            if index <= 1 { return false }
            if heap[index].cost == heap[index/2].cost {
                return heap[index].node < heap[index/2].node
            }
            return heap[index].cost < heap[index/2].cost
        }
        
        while isMoveUp(insertedIndex) {
            heap.swapAt(insertedIndex, insertedIndex/2)
            insertedIndex = insertedIndex / 2
        }
    }
    
    enum moveDownStatus {
        case none, left, right
    }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnValue = heap[1]
        heap[1] = heap[heap.count-1]
        heap.removeLast()
        
        func moveDown(_ index: Int) -> moveDownStatus {
            let left = index * 2
            let right = left + 1
            
            if left >= heap.count {
                return .none
            }
            
            if right >= heap.count {
                if heap[left].cost == heap[index].cost {
                    return heap[left].node < heap[index].node ? .left: .none
                }
                return heap[left].cost < heap[index].cost ? .left: .none
            }
            
            if heap[left].cost > heap[index].cost && heap[right].cost > heap[index].cost {
                return .none
            }
            
            if heap[left].cost == heap[right].cost {
                return heap[left].node < heap[right].node ? .left: .right
            }
            return heap[left].cost < heap[right].cost ? .left: .right
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnValue
            case .left: 
                heap.swapAt(poppedIndex, poppedIndex * 2)
                poppedIndex = poppedIndex * 2
            case .right:
                heap.swapAt(poppedIndex, poppedIndex * 2 + 1)
                poppedIndex = poppedIndex * 2 + 1
            }
        }
    }
}

let INF = 10000001
var adjacency = [[(node: Int, cost: Int)]](repeating: [(node: Int, cost: Int)](), count: 50001)
var nodeInfo = [Int]() // 0 = 쉼터, 1 = 출발, 2 = 봉우리
var answer: (node: Int, cost: Int) = (-1, INF)
var visited = [Bool]()
var intensity = [Int]()

func dijkstra(_ start: Int) {
    var pq = MinHeap()
    pq.insert((0, start))
    intensity[start] = 0
    
    while !pq.isEmpty() {
        guard let top = pq.pop() else { break }
        if visited[top.node] { continue } 
        visited[top.node] = true
        
        if nodeInfo[top.node] == 2 {
            if answer.cost == intensity[top.node] {
                answer.node = min(answer.node, top.node)
            } else if answer.cost > intensity[top.node] {
                answer = (top.node, intensity[top.node])
            }
            return
        }
        
        for next in adjacency[top.node] {
            if visited[next.node] { continue }
            if nodeInfo[next.node] == 1 { continue } // gate
            if intensity[next.node] < next.cost { continue }
            
            intensity[next.node] = max(intensity[top.node], next.cost)
            pq.insert((next.cost, next.node))
        }
    }
}

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {

    for path in paths {
        adjacency[path[0]].append((path[1], path[2]))
        adjacency[path[1]].append((path[0], path[2]))
    }
    
    nodeInfo = [Int](repeating: 0, count: n+1)
    for gate in gates { 
        nodeInfo[gate] = 1
    }
    for summit in summits {
        nodeInfo[summit] = 2
    }
    
    for gate in gates {
        visited = [Bool](repeating: false, count: n+1)
        intensity = [Int](repeating: INF, count: n+1)
        dijkstra(gate)
    }
    
    return [answer.node, answer.cost]
}
