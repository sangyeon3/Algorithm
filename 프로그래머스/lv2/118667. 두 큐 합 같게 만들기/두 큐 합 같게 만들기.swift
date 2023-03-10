import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    let queueSize = queue1.count
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    let halfSum = (sum1 + sum2) / 2
    
    var q1 = queue1, q2 = queue2
    var idx1 = 0, idx2 = 0, count = 0
    var ans = -1
    
    while idx1 < queueSize + idx2 && idx2 < queueSize + idx1 {
        if sum1 == halfSum {
            return count
        }
        if count > queueSize * 2 + 10 {
            break
        }
        
        if sum1 < halfSum {
            q1.append(q2[idx2])
            sum1 += q2[idx2]
            sum2 -= q2[idx2]
            idx2 += 1
        } else {
            q2.append(q1[idx1])
            sum1 -= q1[idx1]
            sum2 += q1[idx1]
            idx1 += 1
        }
        count += 1
    }

    return -1
}