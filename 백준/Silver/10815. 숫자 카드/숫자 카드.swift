import Foundation

let N = Int(readLine()!)!
let cards = readLine()!.split{$0 == " "}.map{Int($0)!}
let M = Int(readLine()!)!
let nums = readLine()!.split{$0 == " "}.map{Int($0)!}

var isExists = [Int: Bool]()
cards.forEach { isExists[$0] = true }
var ans = ""
nums.forEach {
    if isExists[$0] != nil {
        ans += "1 "
    } else {
        ans += "0 "
    }
}
print(ans)
