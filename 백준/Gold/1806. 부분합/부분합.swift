import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, s) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

var sumArr = [Int]([0])
for i in 0..<n {
    sumArr.append(arr[i] + sumArr[i])
}

var i = 0, j = 1    // 인덱스 i+1 ~ j까지 합
var ans = 1000000
while i <= n {
    let partSum = sumArr[j] - sumArr[i]
    if partSum > s {
        ans = min(ans, j-i)
        i += 1
    } else if partSum == s {
        ans = min(ans, j-i)
        j += 1
        if j > n { break }
    } else if partSum < s {
        j += 1
        if j > n { break }
    }
}

print(ans == 1000000 ? 0: ans)
