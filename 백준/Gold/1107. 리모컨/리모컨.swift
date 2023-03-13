import Foundation

let (N, M) = (Int(readLine()!)!, Int(readLine()!)!)
var isBroken = [Bool](repeating: false, count: 10)

if M > 0 { readLine()!.split(separator: " ").forEach { isBroken[Int($0)!] = true } }

var count = 0

func solution() {
    while true {
        if (100 + count == N) || (100 - count == N) {
            print(count)
            return
        } else if isEnable(N-count) {
            let length = String(N-count).count
            if checkLess(count, length) { return }
            print(count + length)
            return
        } else if isEnable(N+count) {
            let length = String(N+count).count
            if checkLess(count, length) { return }
            print(count + length)
            return
        }
        
        count += 1
    }
}

func isEnable(_ channel: Int) -> Bool {
    if channel < 0 { return false }
    
    var num = channel
    for _ in 0..<(String(channel).count) {
        if isBroken[num % 10] { return false }
        num /= 10
    }
    return true
}

func checkLess(_ count: Int, _ length: Int) -> Bool {
    for i in 1..<length {
        if (100 + (count+i) == N) || (100 - (count+i) == N) {
            print(count + i)
            return true
        }
    }
    return false
}

solution()
