import Foundation

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (M, N) = (input[0], input[1])

var arr = [[Int]]()
for _ in 0..<M {
    arr.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

var ans = 0

for i in 0..<M-1 {
    let sorted = arr[i].enumerated().sorted{ $0.element < $1.element }
    for j in (i+1)..<M {
        var state = true
        for k in 0..<N-1 {
            if sorted[k].element == sorted[k+1].element {
                if arr[j][sorted[k].offset] != arr[j][sorted[k+1].offset] {
                    state = false
                    break
                }
            } else if arr[j][sorted[k].offset] > arr[j][sorted[k+1].offset] {
                state = false
                break
            }
        }
        if state {
            ans += 1
        }
    }
}

print(ans)
