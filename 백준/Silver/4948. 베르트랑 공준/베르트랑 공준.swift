import Foundation

var isPrime = [Bool](repeating: true, count: 250000)
isPrime[0] = false
isPrime[1] = false

for i in 2..<250000 {
    if !isPrime[i] { continue }
    for j in stride(from: 2*i, to: 250000, by: i) { isPrime[j] = false }
}

while true {
    let number = Int(readLine()!)!
    if number == 0 { break }

    print(isPrime.enumerated().filter { (index, element) in
        ((number+1)...2*number).contains(index) && element
    }.count)
}
