import Foundation

func solution(_ myString:String) -> [Int] {
    var arr = myString.map{ String($0) }
    
    var ans = [Int]()
    var count = 0
    for i in 0..<arr.count {
        if arr[i] == "x" {
            ans.append(count)
            count = 0
        } else {
            count += 1
        }
    }
    ans.append(count)
    
    return ans
}