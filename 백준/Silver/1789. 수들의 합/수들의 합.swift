import Foundation

let S = Int(readLine()!)!
var (length, num) = (2, 1)

while num + length - 1 < S {
    num += length
    length += 1
}

print(length-1)