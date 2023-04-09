import Foundation

// 소수 구하기
var isPrime = [Bool](repeating: true, count: 10001)
isPrime[0] = false
isPrime[1] = false
for i in 2...100 {
    if !isPrime[i] { continue }
    var j = i+i
    while j <= 10000 {
        isPrime[j] = false
        j += i
    }
}

// solution
let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)!
    var first = N/2, second = N/2
    while true {
        if isPrime[first] && isPrime[second] {
            print(first, second)
            break
        }
        first -= 1
        second += 1
    }
}
