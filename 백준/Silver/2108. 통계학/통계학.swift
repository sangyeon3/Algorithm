import Foundation

let N = Int(readLine()!)!
var numbers = [Int]()

for _ in (0..<N) {
    let number = Int(readLine()!)!
    numbers.append(number)
}

numbers.sort()

print(Int(round(Double(numbers.reduce(0){ $0 + $1 }) / Double(N))))
print(numbers[N/2])

var counts = [Int](repeating: 0, count: 8004)
var maxCount = 0
var maxNumbers = [Int]()
numbers.forEach {
    counts[$0 + 4000] += 1
    if maxCount < counts[$0 + 4000] {
        maxCount = counts[$0 + 4000]
        maxNumbers = [$0]
    } else if maxCount == counts[$0 + 4000] {
        maxNumbers.append($0)
    }
}
if maxNumbers.count == 1 { print(maxNumbers[0]) }
else {
    maxNumbers.sort()
    print(maxNumbers[1])
}

if N == 1 { print(0) }
else { print(numbers[N-1] - numbers[0]) }
