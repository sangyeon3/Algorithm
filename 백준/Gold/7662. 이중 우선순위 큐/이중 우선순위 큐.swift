import Foundation

struct Heap<T> {
    var heap = [T]()
    let compare: (T, T) -> Bool
    
    var count: Int {
        heap.count <= 1 ? 0 : heap.count - 1
    }
    
    var isEmpty: Bool {
        count == 0
    }
    
    var top: T? {
        if isEmpty { return nil }
        return heap[1]
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
            if compare(heap[insertedIndex / 2], heap[insertedIndex]) {
                break
            }
            heap.swapAt(insertedIndex, insertedIndex / 2)
            insertedIndex = insertedIndex / 2
        }
    }
    
    enum moveDownStatus { case none, left, right }
    
    @discardableResult
    mutating func pop() -> T? {
        if isEmpty { return nil }
        
        let ret = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ idx: Int) -> moveDownStatus {
            let left = idx * 2, right = idx * 2 + 1
            
            if left >= heap.count { return .none }
            
            if right >= heap.count {
                if compare(heap[left], heap[idx]) { // 적극적, 질문 마니
                    return .left
                }
                return .none
            }
            
            if compare(heap[idx], heap[left]) && compare(heap[idx], heap[right]) {
                return .none
            }
            
            if compare(heap[left], heap[idx]) && compare(heap[right], heap[idx]) {
                return compare(heap[left], heap[right]) ? .left : .right
            }
            
            return compare(heap[left], heap[right]) ? .left : .right
        }
        
        var poppedIndex = 1
        
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return ret
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

for _ in 0..<Int(readLine()!)! {
    var maxHeap = Heap<Int>(compare: >)
    var minHeap = Heap<Int>(compare: <)
    var count = [Int: Int]()

    for _ in 0..<Int(readLine()!)! {
        let input = readLine()!.split(separator: " ").map{String($0)}
        let num = Int(input[1])!

        if input[0] == "I" {    // 삽입
            maxHeap.insert(num)
            minHeap.insert(num)
            count[num] = (count[num] ?? 0) + 1

        } else if input[0] == "D" && num == 1 { // 최대값 삭제
            while true {
                guard let top = maxHeap.top else {
                    break
                }
                if let c = count[top], c > 0 {
                    break
                }
                maxHeap.pop()
            }

            guard let del = maxHeap.pop() else { continue }
            count[del]! -= 1

            if count[del]! <= 0 {
                count[del] = nil
            }

        } else { // 최소값 삭제
            while true {
                guard let top = minHeap.top else {
                    break
                }
                if let c = count[top], c > 0 {
                    break
                }
                minHeap.pop()
            }

            guard let del = minHeap.pop() else { continue }
            count[del]! -= 1

            if count[del]! <= 0 {
                count[del] = nil
            }
        }
    }

    while true {
        guard let top = maxHeap.top else {
            break
        }
        if let c = count[top], c > 0 {
            break
        }
        maxHeap.pop()
    }
    guard let max = maxHeap.pop() else {
        print("EMPTY")
        continue
    }

    while true {
        guard let top = minHeap.top else {
            break
        }
        if let c = count[top], c > 0 {
            break
        }
        minHeap.pop()
    }

    guard let min = minHeap.pop() else {
        continue
    }

    print(max, min)
}
