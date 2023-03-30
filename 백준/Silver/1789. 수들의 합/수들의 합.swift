import Foundation

let S = Int(readLine()!)!
var (cur, length, num) = (1, 2, 1)

while num + length - 1 < S {
    num += length
    cur += 1
    length += 1
}

print(cur)