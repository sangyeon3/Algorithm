import Foundation

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (N, M) = (input[0], input[1])

var adj = [[Int]](repeating: [Int](), count: N)
var deg = [Int](repeating: 0, count: N)
for _ in 0..<M {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    adj[input[0]-1].append(input[1])
    deg[input[1]-1] += 1
}

var stack = [Int](deg.enumerated().filter{ $0.element == 0 }.map{$0.offset+1})
var ans = stack.reduce("") { $0 + "\($1) " }
while !stack.isEmpty {
    let t = stack.removeLast()
    for next in adj[t-1] {
        deg[next-1] -= 1
        if deg[next-1] < 1 {
            stack.append(next)
            ans += "\(next) "
        }
    }
}
print(ans)
