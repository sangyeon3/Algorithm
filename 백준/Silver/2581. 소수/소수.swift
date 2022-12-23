import Foundation

let m = Int(readLine()!)!
let n = Int(readLine()!)!

var isPrime = [Bool](repeating: true, count: 10001)
isPrime[1] = false
for i in 1...n {
    if !isPrime[i] { continue }
    for j in stride(from: 2*i, to: n+1, by: i) { isPrime[j] = false }
}

var primes = (m...n).filter { isPrime[$0] }
if primes.isEmpty { print("-1") }
else {
    print(primes.reduce(0) { $0 + $1 })
    print(primes[0])
}
