import Foundation

// 소수 구하기
var isPrime = [Bool](repeating: true, count: 10000001)
isPrime[0] = false
isPrime[1] = false
for i in 2...4000 {
    if !isPrime[i] { continue }
    var j = i+i
    while j <= 10000000 {
        isPrime[j] = false
        j += i
    }
}

let primes = isPrime.enumerated().filter{ $0.element }.map{ $0.offset }

// solution
var N = Int(readLine()!)!
var index = 0
while N > 1 {
    if N % primes[index] == 0 {
        N = N / primes[index]
        print(primes[index])
    } else {
        index += 1
    }
}
