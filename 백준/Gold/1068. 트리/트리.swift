import Foundation

let N = Int(readLine()!)!
var descendents: [Int: [Int]] = [:]
for i in -1..<N { descendents[i] = [] }

let relations = (readLine()!).split(separator: " ").map { Int($0)! }
relations.enumerated()
    .forEach { (descendent, parent) in
        descendents[parent] = (descendents[parent] ?? []) + [descendent]
    }

var removeNodes = [Int(readLine()!)!]
if descendents[-1] == removeNodes { print("0") }
else {
    let parent = Int(relations[relations.index(relations.startIndex, offsetBy: removeNodes[0])])
    descendents[parent]?.removeAll(where: { $0 == removeNodes[0] })
    while !removeNodes.isEmpty {
        let removeNode = removeNodes[0]
        removeNodes.append(contentsOf: descendents[removeNode] ?? [])
        descendents[removeNode] = nil
        removeNodes.removeFirst()
    }
    print(descendents.filter { $0.value.isEmpty }.count)
}
