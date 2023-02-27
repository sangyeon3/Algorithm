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

let fileIO = FileIO()

let (N, M) = (fileIO.readInt(), fileIO.readInt())

// weighted union find
var parent = [Int](repeating: 0, count: N+1)

func find(_ x: Int) -> Int {
    if parent[x] < 0 { return x }
    
    let y = find(parent[x])
    parent[x] = y
    return y
}

func union(_ u: Int, _ v: Int) {
    let x = find(u)
    let y = find(v)
    
    if x == y { return }
    if parent[x] < parent[y] {
        parent[x] += parent[y]
        parent[y] = x
    } else {
        parent[y] += parent[x]
        parent[x] = y
    }
}

for i in 1...N { parent[i] = -1 }

for _ in 0..<M {
    let (u, v) = (fileIO.readInt(), fileIO.readInt())
    union(u, v)
}

var ans = 0

for i in 1...N {
    if parent[i] < 0 { ans += 1 }
}

print(ans)
