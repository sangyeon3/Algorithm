import Foundation

func solution(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
    var cur = a
    var ans = 0
    for i in 0..<included.count {
        if included[i] {
            ans += cur
        }
        cur += d
    }
    return ans
}