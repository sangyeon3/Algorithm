import Foundation

let N = Int(readLine()!)!
let people = readLine()!.split{$0 == " "}.map{String($0)}.sorted(by: <)
let M = Int(readLine()!)!
var whtkd = [String: [String]]()

for _ in 0..<M {
    let input = readLine()!.split{$0==" "}.map{String($0)}
    if whtkd[input[0]] == nil { whtkd[input[0]] = [input[1]] }
    else { whtkd[input[0]]!.append(input[1]) }
}

var roots = [String]()
var visited = [String: Bool]()
var children = [String: [String]]()

for p in people {
    if visited[p] != nil { continue }
    visited[p] = true
    
    if whtkd[p] == nil {
        roots.append(p)
        continue
    }
    
    for next in whtkd[p]! {
        if whtkd[next] == nil {
            if whtkd[p]!.count == 1 {
                if children[next] == nil { children[next] = [p] }
                else { children[next]!.append(p) }
            }
            continue
        }
        if whtkd[next]!.count + 1 == whtkd[p]!.count {
            if children[next] == nil { children[next] = [p] }
            else { children[next]!.append(p) }
        }
    }
}

print(roots.count)
print(roots.sorted().reduce("") { $0 + "\($1) " })

people.forEach {
    if children[$0] == nil {
        print($0, 0)
    } else {
        print($0, children[$0]!.count, children[$0]!.sorted().reduce(""){$0 + "\($1) "})
    }
}
