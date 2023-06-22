import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var i = 0, j = 0, sum = sequence[0]
    var ans = [Int]()
    while i <= j {
        if sum == k {
            if ans.isEmpty || ans[1]-ans[0]+1 > j-i+1 {
                ans = [i, j]
            }
        }
        if sum <= k {
            j += 1
            if j >= sequence.count { break }
            sum += sequence[j]
        } else {
            sum -= sequence[i]
            i += 1
            if i >= sequence.count { break }
        }
        
    }
    
    return ans
}