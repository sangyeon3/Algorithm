import Foundation

let i = readLine()!.split{$0 == " "}.map{Int($0)!}
let (N, M) = (i[0], i[1])

var arr = [Int]()
for _ in 0..<N { arr.append(Int(readLine()!)!) }

arr.sort(by: <)

var i1 = 0, i2 = 0
var ans = 2000000001
while i1 <= i2 && i2 < N && i1 < N {
    let diff = arr[i2] - arr[i1]
    if diff < M { i2 += 1 }
    else {
        ans = min(ans, diff)
        i1 += 1
    }
}
print(ans)
