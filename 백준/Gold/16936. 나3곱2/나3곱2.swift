import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var sequence = [Int]()
var visited = [Bool](repeating: false, count: N)
var answerState = false

func recursion(_ count: Int) {
    if count == N {
        print(sequence.reduce("") { $0 + "\($1) " })
        answerState = true
        return
    }
    
    var num = sequence.last!
    var state = false
    
    if num % 3 == 0, let idx = arr.firstIndex(of: num / 3), !visited[idx], !answerState {
        sequence.append(num / 3)
        recursion(count + 1)
        state = true
    }
    if let idx = arr.firstIndex(of: num * 2), !visited[idx], !answerState {
        sequence.append(num * 2)
        recursion(count + 1)
        state = true
    }
    
    if !state {
        return
    }
}

for i in 0..<N where !answerState {
    visited = [Bool](repeating: false, count: N)
    sequence = [Int]([arr[i]])
    visited[i] = true
    recursion(1)
}
