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
    
    mutating func enqueue(_ data: T) {
        queue.append(data)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty { return nil }
        let returnValue = queue[index]
        queue[index] = nil
        index += 1
        
        return returnValue
    }
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    
    var queue = Queue<(Int, String)>()
    var visited = [Bool](repeating: false, count: 10000)
    
    queue.enqueue((a, ""))
    visited[a] = true
    
    while !queue.isEmpty {
        guard let f = queue.dequeue() else { break }
        visited[f.0] = true
        if f.0 == b {
            print(f.1)
            break
        }
        
        var n = (f.0 * 2) % 10000
        if !visited[n] {
            visited[n] = true
            queue.enqueue((n, f.1 + "D"))
        }
        n = (f.0 != 0 ? f.0 - 1 : 9999)
        if !visited[n] {
            visited[n] = true
            queue.enqueue((n, f.1 + "S"))
        }
        n = (f.0%1000)*10 + f.0/1000
        if !visited[n] {
            visited[n] = true
            queue.enqueue((n, f.1 + "L"))
        }
        n = ((f.0%10)*10000 + f.0)/10
        if !visited[n] {
            visited[n] = true
            queue.enqueue((n, f.1 + "R"))
        }
    }
}