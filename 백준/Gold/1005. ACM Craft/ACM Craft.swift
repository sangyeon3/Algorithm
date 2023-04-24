import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}


let file = FileIO()

let tc = file.readInt()

for _ in 0..<tc {
    let (N, K) = (file.readInt(), file.readInt())
    var times = [Int]()
    for _ in 0..<N {
        times.append(file.readInt())
    }
    
    var relations = [[Int]](repeating: [Int](), count: N+1)
    var inDegree = [Int](repeating: 0, count: N+1)
    for _ in 0..<K {
        let input = [file.readInt(), file.readInt()]
        relations[input[0]].append(input[1])
        inDegree[input[1]] += 1
    }
    
    let w = file.readInt()
    
    var queue = [Int]()
    var minTime = [Int](repeating: 0, count: N+1)
    for i in 1...N where inDegree[i] == 0 {
        queue.append(i)
        minTime[i] = times[i-1]
    }
    
    var queueIndex = 0
    while queueIndex < queue.count {
        let f = queue[queueIndex]
        queueIndex += 1
        
        if f == w { break }
        for next in relations[f] {
            if inDegree[next] <= 0 { continue }
            inDegree[next] -= 1
            minTime[next] = max(minTime[next], minTime[f] + times[next-1])
            if inDegree[next] <= 0 {
                queue.append(next)
            }
        }
    }

    print(minTime[w])
}
