import Foundation

let r = 31, m = 1234567891
let length = Int(readLine()!)!
let string = readLine()!

var pows = [Int]()
pows.append(1)
for i in 1..<50 {
    pows.append((pows[i-1] * 31) % m)
}

var ans = 0
for i in 0..<length {
    guard let char = string[i] else { continue }
    let number = Int(UnicodeScalar(char)!.value) - 97 + 1
    ans = (ans + (number * pows[i]) % m) % m
}
print(ans)

extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}
