import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    let queueSize = queue1.count
    let queue = queue1 + queue2
    var idx1 = 0, idx2 = queueSize
    var sum1 = queue1.reduce(0, +), sum2 = queue2.reduce(0, +)
    var ans = 0
    
    while true {
        if sum1 == sum2 { return ans }
        else if sum1 > sum2 {
            sum1 -= queue[idx1]
            sum2 += queue[idx1]
            idx1 = (idx1 + 1) % (queueSize * 2)
        } else {
            sum1 += queue[idx2]
            sum2 -= queue[idx2]
            idx2 = (idx2 + 1) % (queueSize * 2)
        }
        ans += 1
        
        if ans > 2 * queueSize + 5 { break }
    }

    return -1
}