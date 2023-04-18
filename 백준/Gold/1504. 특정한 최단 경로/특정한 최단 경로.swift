import Foundation

class Heap<T> {
    var compare: (T, T) -> Bool
    var li = [T]()

    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    var isEmpty: Bool {
        li.isEmpty
    }

    func p(_ n: Int) -> Int { (n-1)/2 }
    func l(_ n: Int) -> Int { n*2+1 }
    func r(_ n: Int) -> Int { (n+1)*2 }

    func append(_ elem: T) {
        li.append(elem)
        var point = li.count-1

        while point > 0 {
            if compare(li[point], li[p(point)]) {
                li.swapAt(p(point), point)
                point = p(point)
            } else {
                break;
            }
        }
    }

    func removeLast() -> T? {
        if li.count == 0 { return nil }
        li.swapAt(0, li.count-1)
        let ret = li.removeLast()

        var point = 0

        while r(point) <= li.count-1 { // 둘다 존재
            let (L, R, me) = (li[l(point)], li[r(point)], li[point])

            if compare(L, R) {
                if compare(L, me) {
                    li.swapAt(l(point), point)
                    point = l(point)
                } else {
                    break;
                }
            } else {
                if compare(R, me) {
                    li.swapAt(r(point), point)
                    point = r(point)
                } else {
                    break;
                }
            }
        }

        if l(point) == li.count - 1 {
            if compare(li[l(point)], li[point]) {
                li.swapAt(l(point), point)
            }
        }

        return ret
    }
}


let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, E) = (input[0], input[1])

var relations = [[(node: Int, cost: Int)]](repeating: [(node: Int, cost: Int)](), count: N+1)
for _ in 0..<E {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    relations[input[0]].append((input[1], input[2]))
    relations[input[1]].append((input[0], input[2]))
}

let mid = readLine()!.split(separator: " ").map{ Int($0)! }

let MAX = 8000000

func dijk(_ start: Int, _ end: Int) -> Int {
    let queue = Heap<(node: Int, cost: Int)>(compare: { $0.cost < $1.cost })
    var dist = [Int](repeating: MAX, count: N+1)
    
    queue.append((start, 0))
    dist[start] = 0
    
    while !queue.isEmpty {
        guard let t = queue.removeLast() else { break }
        
        for n in relations[t.node] {
            if t.cost + n.cost < dist[n.node] {
                dist[n.node] = t.cost + n.cost
                queue.append((n.node, dist[n.node]))
            }
        }
    }
    
    return dist[end]
}

let v1ToV2 = dijk(mid[0], mid[1])

let sToV1 = dijk(1, mid[0])
let v2ToE = dijk(mid[1], N)

let sToV2 = dijk(1, mid[1])
let v1ToE = dijk(mid[0], N)

if v1ToV2 == MAX || ((sToV1 == MAX || v2ToE == MAX) && (sToV2 == MAX || v1ToE == MAX)) {
    print(-1)
} else if (sToV1 == MAX || v2ToE == MAX) {
    print(sToV2 + v1ToV2 + v1ToE)
} else if (sToV2 == MAX || v1ToE == MAX) {
    print(sToV1 + v1ToV2 + v2ToE)
} else {
    print(min(sToV2 + v1ToV2 + v1ToE, sToV1 + v1ToV2 + v2ToE))
}
