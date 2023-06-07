import Foundation

var count = 0.0
var sum = 0.0

let rates = ["A+": 4.5, "A0": 4.0, "B+": 3.5, "B0": 3.0, "C+": 2.5, "C0": 2.0, "D+": 1.5, "D0": 1.0, "F": 0.0]

for _ in 0..<20 {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    let score = Double(input[1])!
    let rate = input[2]
    
    if rate == "P" { continue }
    
    count += score
    sum += score * rates[rate]!
}

print(sum / count)
