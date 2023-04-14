import Foundation

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (na, nb) = (input[0], input[1])

let arra = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted(by: <)

var setb = [Int: Bool]()
readLine()!.split{$0 == " "}.forEach {
    setb[Int($0)!] = true
}

var count = 0
var ans = ""
arra.forEach {
    if setb[$0] == nil {
        count += 1
        ans += "\($0) "
    }
}
print(count)
if count != 0 { print(ans) }
