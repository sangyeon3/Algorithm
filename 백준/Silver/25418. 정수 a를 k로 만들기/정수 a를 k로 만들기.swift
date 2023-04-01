import Foundation

let input = readLine()!.split{$0==" "}.map{ Int($0)! }
var queue = [(Int, Int)]([(input[0], 0)])
var visited = [Bool](repeating: false, count: 1000001)
visited[input[0]] = true
var state = false
var index = 0
while !queue.isEmpty && !state {
    let f = queue[index]
    index += 1
    let arr = [f.0+1, f.0*2]
    for a in arr {
        if a > 1000000 || visited[a] { continue }
        if a == input[1] { print(f.1+1); state=true; break }
        visited[a] = true
        queue.append((a, f.1+1))
    }
}
