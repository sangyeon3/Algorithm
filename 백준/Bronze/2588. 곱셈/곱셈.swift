import Foundation

let (a, b) = (Int(readLine()!)!, Int(readLine()!)!)

var tmp = b
for _ in 0..<3 {
    let c = tmp % 10
    tmp /= 10
    print(a * c)
}
print(a * b)
