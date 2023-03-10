import Foundation

func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
    
    cycle(0, [])
    
    return result
}

func solution(_ relation:[[String]]) -> Int {
    
    let rowCount = relation.count
    let columnCount = relation[0].count
    
    var arr = [[Int]]()
    
    for row in 1...rowCount {
        let indexCombinations = combination(Array(0..<columnCount), row)
        for indexes in indexCombinations {
            let r = Set(relation.map{ r in
                indexes.map { r[$0] }
            })
            
            if r.count != rowCount { continue }
            
            var state = true
            for elem in arr {
                if (Set(indexes + elem)).count == indexes.count {
                    state = false
                    break
                }
            }
            if state {
                arr.append(indexes)
            }
        }
    }

    return arr.count
}