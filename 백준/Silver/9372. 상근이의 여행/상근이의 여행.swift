import Foundation

for _ in 0..<(Int(readLine()!)!) {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    let (N, M) = (input[0], input[1])
    var relations = [[Int]](repeating: [Int](), count: N+1)
    for _ in 0..<M {
        let input = readLine()!.split{$0 == " "}.map{Int($0)!}
        relations[input[0]].append(input[1])
        relations[input[1]].append(input[0])
    }
    
    var visited = [Bool](repeating: false, count: N+1)
    var queue = [Int]([1])
    visited[1] = true
    var count = 0
    
    while !queue.isEmpty {
        let t = queue.removeFirst()
        for next in relations[t] {
            if visited[next] { continue }
            visited[next] = true
            queue.append(next)
            count += 1
        }
    }
    print(count)
}
