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
let str1 = file.readString()
let str2 = file.readString()

var dp = [[(length: Int, prev: (i: Int, j: Int))]](repeating: [(length: Int, prev: (i: Int, j: Int))](repeating: (0, (-1, -1)), count: 1001), count: 1001)
var maxAns: (length: Int, prev: (i: Int, j: Int)) = (0, (-1, -1))

for (i, c1) in str1.enumerated() {
    let i = i+1
    for (j, c2) in str2.enumerated() {
        let j = j+1
        if c1 == c2 {
            dp[i][j] = (dp[i-1][j-1].length + 1, (i-1, j-1))
            if maxAns.length < dp[i][j].length {
                maxAns = (dp[i][j].length, (i-1, j-1))
            }
        }
        else { dp[i][j] = [dp[i-1][j], dp[i][j-1]].max(by: { $0.length < $1.length })! }
    }
}

print(maxAns.length)
if maxAns.length != 0 {
    var lcs = ""
    var idx: (i: Int, j: Int) = maxAns.prev
    while idx.i != -1 {
        lcs.append(str1[idx.i]!)
        idx = dp[idx.i][idx.j].prev
    }
    
    var ans = ""
    lcs.reversed().forEach{ ans.append($0) }
    print(ans)
}

extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else { return nil }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}
