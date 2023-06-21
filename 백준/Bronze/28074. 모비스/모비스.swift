import Foundation

let input = readLine()!.map{ String($0) }

print((input.contains("M") && input.contains("O") && input.contains("B") && input.contains("I") && input.contains("S")) ? "YES" : "NO")
