import Foundation

func addPadding(_ string: String, size: Int) -> String {
    if string.count == size { return string }
    var padded = string
    for _ in 0..<(size - string.count) {
        padded = "0" + padded
    }
    return padded
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    var ans = [Int](repeating: 0, count: 11)
    var maxDiff = 0
    
    for i in 1..<2048 {
        var binary = String(i, radix: 2)
        binary = addPadding(binary, size: 11)
        
        var apeach = 0
        var rian = 0
        var remain = n
        var arr = [Int](repeating: 0, count: 11)
        
        for j in 0..<11 {
            if info[j] > 0 { apeach += (10 - j) }
            if binary[j] == "1", remain >= (info[j] + 1) {
                remain -= (info[j] + 1)
                rian += (10 - j)
                if info[j] > 0 { apeach -= (10 - j) }
                arr[j] = info[j] + 1
            }
        }
        if remain > 0 { arr[10] += remain }
        
        // 점수차 비교
        let diff = rian - apeach
        if maxDiff < diff {
            maxDiff = diff
            ans = arr
        } else if maxDiff == diff {
            // ans와 arr 비교. 낮은 점수 많이 맞춘 경우 선택
            for j in 0..<11 {
                if arr[10-j] > ans[10-j] {
                    ans = arr
                    break
                }
                else if arr[10-j] < ans[10-j] { break }
            }
        }
    }
    if maxDiff == 0 { return [-1] }
    return ans
}

extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}