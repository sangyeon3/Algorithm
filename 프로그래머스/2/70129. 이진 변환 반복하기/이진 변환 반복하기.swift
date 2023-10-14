import Foundation

func solution(_ s:String) -> [Int] {
    
    var str = s
    var count = 0, zeroCount = 0
    while str != "1" {
        count += 1
        
        let prevLength = str.count
        str = str.filter { $0 == "1" }
        zeroCount += prevLength - str.count
        
        str = String(str.count, radix:2)
    }
    
    return [count, zeroCount]
}