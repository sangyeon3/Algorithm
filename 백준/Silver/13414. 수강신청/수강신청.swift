import Foundation

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (K, L) = (input[0], input[1])

var arr = [String]()
var idx = 0
var index = [String: Int]()

for _ in 0..<L {
    let num = readLine()!
    arr.append(num)
    index[num] = idx
    idx += 1
}

var count = 0
var ans = ""
idx = 0
while count < K && idx < arr.count {
    if idx == index[arr[idx]] {
        ans += "\(arr[idx])\n"
        count += 1
    }
    idx += 1
}
ans.removeLast()
print(ans)
