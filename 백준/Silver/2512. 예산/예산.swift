import Foundation

let N = Int(readLine()!)!
let req = readLine()!.split{$0 == " "}.map{Int($0)!}
let M = Int(readLine()!)!

func check(_ num: Int) -> (Bool, Int) {
    var sum = 0
    var max_ = 0
    req.forEach {
        let tmp = ($0 > num ? num : $0)
        sum += tmp
        max_ = max(max_, tmp)
    }
    if sum <= M { return (true, max_) }
    return (false, -1)
}

var s = 0, e = M
var ans = 0
while s <= e {
    if s == e { break }
    let m = s + ((e - s) / 2)
    let ret = check(m)
    if ret.0 {
        s = m + 1
        ans = ret.1
    } else {
        e = m
    }
}
print(ans)
