import Foundation

var nodeInfo = [Int]()
var adjacency = [[Int]](repeating: [Int](), count: 17)
var visited = [Bool]()
var ans = 0

func dfs() {
    var sheep = 0, wolf = 0
    
    let list = visited.enumerated()
    .filter { $0.element == true }
    .map { $0.offset }
    
    list.forEach {
        if nodeInfo[$0] == 0 { sheep += 1 } 
        else { wolf += 1 }
    }
    
    ans = max(sheep, ans)
    
    for l in list {
        for next in adjacency[l] {
            if visited[next] { continue }
            if nodeInfo[next] == 0 {
                visited[next] = true
                dfs()
                visited[next] = false
            } else if sheep > wolf + 1 {
                visited[next] = true
                dfs()
                visited[next] = false
            }
        }   
    }
}

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    nodeInfo = info
    visited = [Bool](repeating: false, count: info.count)
    
    edges.forEach { edge in
        adjacency[edge[0]].append(edge[1])
        adjacency[edge[1]].append(edge[0])
    }
    
    visited[0] = true
    dfs()
    
    return ans
}
