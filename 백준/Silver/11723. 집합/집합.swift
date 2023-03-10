import Foundation

import Foundation

class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

let fileIO = FileIO()

let N = fileIO.readInt()
var arr = [Bool](repeating: false, count: 21)
var result = ""

for _ in 0..<N {
    let command = fileIO.readStirngSum()
    
    switch command {
    case 297:
        let num = fileIO.readInt()
        arr[num] = true
    case 654:
        let num = fileIO.readInt()
        arr[num] = false
    case 510:
        let num = fileIO.readInt()
        result += arr[num] ? "1\n" : "0\n"
    case 642:
        let num = fileIO.readInt()
        arr[num] = !arr[num]
    case 313:
        arr = [Bool](repeating: true, count: 21)
    case 559:
        arr = [Bool](repeating: false, count: 21)
    default:
        break
    }
}
print(result)
