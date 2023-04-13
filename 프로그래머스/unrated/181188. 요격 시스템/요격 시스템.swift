import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted{ 
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] < $1[0]
    }
    var scopes = [[Int]]([targets[0]])
    var scopeCount = 1
    
    if targets.count == 1 { return 1 }
    
    for i in 1..<targets.count {
        let scope = scopes[scopeCount-1]
        if scope[1] <= targets[i][0] {
            scopes.append(targets[i])
            scopeCount += 1
        } else {
            scopes[scopeCount-1][0] = targets[i][0]
            if targets[i][1] < scopes[scopeCount-1][1] {
                scopes[scopeCount-1][1] = targets[i][1]
            }
        }
    }
    
    return scopeCount
}