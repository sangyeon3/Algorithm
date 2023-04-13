import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted{ $0[1] < $1[1] }
    if targets.count == 1 { return 1 }
    
    var end = targets[0][1], count = 1
    
    for i in 1..<targets.count {
        if end <= targets[i][0] {
            end = targets[i][1]
            count += 1
        }
    }
    
    return count
}