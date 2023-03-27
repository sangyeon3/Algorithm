import Foundation

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
var password: [String: String] = [:]

for _ in 0..<NM[0] {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    password[input[0]] = input[1]
}

for _ in 0..<NM[1] {
    let site = readLine()!
    print(password[site]!)
}
