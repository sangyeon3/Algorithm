import Foundation

struct Queue<T> {
    var queue = [T?]()
    var index = 0
    
    var count: Int {
        queue.count - index
    }
    
    var isEmpty: Bool {
        count == 0
    }
    
    mutating func push(_ data: T) {
        queue.append(data)
    }
    
    mutating func pop() -> T? {
        guard !isEmpty, let returnValue = queue[index] else { return nil }
        
        queue[index] = nil
        index += 1
        
        if index > 1000 {
            queue.removeFirst(index)
            index = 0
        }
        
        return returnValue
    }
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])
var arr = [[Int]]()
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var houses = [(y: Int, x: Int)]()
var chickens = [(y: Int, x: Int)]()
for i in 0..<N {
    for j in 0..<N {
        if arr[i][j] == 1 { houses.append((i, j)) }
        else if arr[i][j] == 2 { chickens.append((i, j)) }
    }
}

var distances = [[(index: Int, distance: Int)]](repeating: [(index: Int, distance: Int)](), count: houses.count)
let moves: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

func bfs(_ index: Int) {
    let house = houses[index]
    var queue = Queue<(y: Int, x: Int, distance: Int)>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    
    queue.push((house.y, house.x, 0))
    visited[house.y][house.x] = true
    
    while !queue.isEmpty {
        guard let f = queue.pop() else { return }
        
        for move in moves {
            let ny = f.y + move.y, nx = f.x + move.x
            if ny < 0 || nx < 0 || ny >= N || nx >= N { continue }
            if visited[ny][nx] { continue }
            
            visited[ny][nx] = true
            queue.push((ny, nx, f.distance+1))
            if arr[ny][nx] == 2 {
                let chickenIndex = chickens.firstIndex { $0 == (ny, nx) }
                guard let chickenIndex = chickenIndex else { continue }
                distances[index].append((chickenIndex, f.distance+1))
            }
        }
    }
}


for index in 0..<houses.count {
    bfs(index)
    distances[index].sort { $0.distance < $1.distance }
}

var removedChicken = [Int]()
var ans = 2*N*houses.count

func calculateDistance() {
    var distance = 0
    for i in 0..<houses.count {
        let shortest = distances[i].first{ !removedChicken.contains($0.index) }
        guard let shortest = shortest else { continue }
        distance += shortest.distance
    }
    ans = min(ans, distance)
}

func brute(_ cur: Int) {
    if removedChicken.count == (chickens.count - M) {
        calculateDistance()
    }
    for i in cur..<chickens.count {
        removedChicken.append(i)
        brute(i+1)
        removedChicken.removeLast()
    }
}

brute(0)

print(ans)
