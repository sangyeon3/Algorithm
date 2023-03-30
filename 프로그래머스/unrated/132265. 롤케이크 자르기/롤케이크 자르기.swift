import Foundation

func solution(_ topping:[Int]) -> Int {
    var topping1 = Set<Int>()
    var count1 = [Int](repeating: 0, count: 10001)
    
    var topping2 = Set<Int>(topping)
    var count2 = [Int](repeating: 0, count: 10001)
    for i in 0..<topping.count {
        count2[topping[i]] += 1
    }
    
    var ans = 0
    for i in 0..<topping.count-1 {
        let num = topping[i]
        topping1.insert(num)
        count1[num] += 1
        
        count2[num] -= 1
        if count2[num] <= 0 { topping2.remove(num) }
        
        if topping1.count == topping2.count {
            ans += 1
        }
    }
    
    return ans
}