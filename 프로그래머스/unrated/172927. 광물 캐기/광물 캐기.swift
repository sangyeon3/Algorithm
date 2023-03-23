import Foundation

var ans = 25*51

func recursion(_ picks: [Int], _ minerals: [String], _ index: Int, _ value: Int) {
    if picks.reduce(0, +) == 0 || index >= minerals.count {
        ans = min(ans, value)
        return
    }
    
    for i in 0..<picks.count {
        if picks[i] < 1 { continue }
        
        var mineralCount = 0, _value = value
        for _ in 0..<5 {
            _value += getValue(i, minerals[index + mineralCount])
            mineralCount += 1
            
            if index + mineralCount >= minerals.count { break }
        }
        
        var _picks = picks
        _picks[i] -= 1
        recursion(_picks, minerals, index + mineralCount, _value)
    }
}

func getValue(_ index: Int, _ mineral: String) -> Int {
    switch index {
        case 0:
            return 1
        case 1:
            if mineral == "diamond" {
                return 5
            } else {
                return 1
            }
        case 2:
            if mineral == "diamond" {
                return 25
            } else if mineral == "iron" {
                return 5
            } else {
                return 1
            }
        default:
            return 0
    }
}

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    recursion(picks, minerals, 0, 0)
    return ans
}