import Foundation

let N = Int(readLine()!)!
var contained = [Bool](repeating: false, count: N+1)
var arr = [Int]()

func myFunc() {
    if arr.count == N {
        print(arr.reduce("") { $0 + "\($1) " })
        return
    }
    for i in 1...N {
        if contained[i] { continue }
        arr.append(i)
        contained[i] = true
        myFunc()
        arr.removeLast()
        contained[i] = false
    }
}

myFunc()
