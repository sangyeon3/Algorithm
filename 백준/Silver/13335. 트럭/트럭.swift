import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, w, L) = (input[0], input[1], input[2])
let weights = readLine()!.split(separator: " ").map{ Int($0)! }

var curWeight = 0
var arr = [Int]()
var index = 0
var ans = 0

while arr.count < w {
    if index < n && curWeight + weights[index] <= L {
        arr.append(weights[index])
        curWeight += weights[index]
        index += 1
    } else {
        arr.append(0)
    }
    ans += 1
}

if index == n {
    print(ans + n)
    exit(0)
}

while index < n {
    let remove = arr.removeFirst()
    curWeight -= remove
    
    if curWeight + weights[index] <= L {
        arr.append(weights[index])
        curWeight += weights[index]
        index += 1
    } else {
        arr.append(0)
    }
    ans += 1
}

print(ans + w)
