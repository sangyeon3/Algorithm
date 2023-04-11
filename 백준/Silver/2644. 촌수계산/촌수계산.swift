import Foundation

let N = Int(readLine()!)!
let people = readLine()!.split(separator: " ").map{ Int($0)! }
let M = Int(readLine()!)!
var parents = [Int](repeating: 0, count: N+1)

for _ in 0..<M {
    let relation = readLine()!.split(separator: " ").map{ Int($0)! }
    parents[relation[1]] = relation[0]
}

var lengths = [Int](repeating: -1, count: N+1)
var a = people[0], b = people[1]
lengths[a] = 0
lengths[b] = 0

while parents[a] != 0 || parents[b] != 0 {
    if parents[a] != 0 && lengths[parents[a]] != -1 {
        print(lengths[parents[a]] + lengths[a] + 1)
        break
    } else if parents[b] != 0 && lengths[parents[b]] != -1 {
        print(lengths[parents[b]] + lengths[b] + 1)
        break
    } else if parents[a] == parents[b] {
        print(lengths[a] + lengths[b] + 2)
        break
    } else {
        if parents[a] != 0 {
            lengths[parents[a]] = lengths[a] + 1
            a = parents[a]
        }
        if parents[b] != 0 {
            lengths[parents[b]] = lengths[b] + 1
            b = parents[b]
        }
    }
}

if parents[a] == 0 && parents[b] == 0 {
    print(-1)
}
