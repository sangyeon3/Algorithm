import Foundation

func solution(_ num_list:[Int]) -> Int {
    var sum1 = 0, sum2 = 0
    for i in 0..<num_list.count {
        if i % 2 == 0 {
            sum1 += num_list[i]
        } else {
            sum2 += num_list[i]
        }
    }
    
    return max(sum1, sum2)
}