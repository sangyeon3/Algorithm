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
    
    var top: T? {
        isEmpty ? nil : heap[0]
    }
    
    func parent(_ idx: Int) -> Int { (idx-1)/2 }
    func left(_ idx: Int) -> Int { idx*2+1 }
    func right(_ idx: Int) -> Int { (idx+1)*2 }
    
    mutating func append(_ data: T) {
        heap.append(data)
        
        var insertedIndex = heap.count - 1
        while insertedIndex > 0 {
            if compare(heap[insertedIndex], heap[parent(insertedIndex)]) {
                heap.swapAt(insertedIndex, parent(insertedIndex))
                insertedIndex = parent(insertedIndex)
            } else {
                break
            }
        }
    }
    
    @discardableResult
    mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        
        let ret = heap[0]
        heap.swapAt(0, heap.count-1)
        heap.removeLast()
        
        var poppedIndex = 0
        while right(poppedIndex) < heap.count {
            let (l, r, cur) = (heap[left(poppedIndex)], heap[right(poppedIndex)], heap[poppedIndex])
            
            if compare(l, r) {
                if compare(l, cur) {
                    heap.swapAt(left(poppedIndex), poppedIndex)
                    poppedIndex = left(poppedIndex)
                } else {
                    break
                }
            } else {
                if compare(r, cur) {
                    heap.swapAt(right(poppedIndex), poppedIndex)
                    poppedIndex = right(poppedIndex)
                } else {
                    break
                }
            }
        }
        if left(poppedIndex) == heap.count - 1 {
            if compare(heap[left(poppedIndex)], heap[poppedIndex]) {
                heap.swapAt(left(poppedIndex), poppedIndex)
                poppedIndex = left(poppedIndex)
            }
        }
        
        return ret
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
            maxHeap.append(num)
            minHeap.append(num)
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
