import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    let max = tangerine.max()!
    var count = [Int](repeating: 0, count: max+1)
    for t in tangerine {
        count[t] += 1
    }
    count.sort(by: >)
    
    var sum = 0
    for i in 0..<max {
        sum += count[i]
        if sum >= k {
            return i+1
        }
    }

    return 0
}