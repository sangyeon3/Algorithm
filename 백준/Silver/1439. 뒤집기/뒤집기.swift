import Foundation
var (s,c) = (readLine()!.map{Int(String($0))!}, 1)
for i in 1..<s.count { if s[i] != s[i-1] { c += 1 } }
print(c/2)
