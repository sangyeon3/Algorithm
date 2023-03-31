import Foundation

var arr = [(Int, Int)]()
for i in 1...8 {
    arr.append((i, Int(readLine()!)!))
}

arr.sort{ $0.1 > $1.1 }
var top = arr.prefix(5)
print(top.reduce(0){$0 + $1.1})
var ans = ""
top.sort{ $0.0 < $1.0 }
top.forEach { ans += String($0.0) + " " }
print(ans)
