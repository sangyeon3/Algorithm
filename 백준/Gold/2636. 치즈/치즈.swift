import Foundation

let moves: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

func dfsAir(_ y: Int, _ x: Int) {
    var queue: [(y: Int, x: Int)] = []
    queue.append((y, x))
    
    while !queue.isEmpty {
        let f = queue.removeFirst()
        for move in moves {
            let nx = f.x + move.x, ny = f.y + move.y
            if ny<0 || nx<0 || ny>=n || nx>=m { continue }

            if arr[ny][nx] != 1 && !visited[ny][nx] {
                visited[ny][nx] = true
                arr[ny][nx] = 2
                queue.append((ny, nx))
            }
        }
    }
}

func findAir() {    // 공기는 2
    for j in 0..<m {
        if arr[0][j] != 1 && !visited[0][j] { dfsAir(0, j) }
        if arr[n-1][j] != 1 && !visited[n-1][j] { dfsAir(n-1, j) }
    }
    for i in 0..<n {
        if arr[i][0] == 0 && !visited[i][0] { dfsAir(i, 0) }
        if arr[i][m-1] == 0 && !visited[i][m-1] { dfsAir(i, m-1) }
    }
}

var spendTime = 0
var cheeseCount = 0

func dfsCheese(_ y: Int, _ x: Int) -> (melting: [(y: Int, x: Int)], cheeseCount: Int) {
    var queue: [(y: Int, x: Int)] = []
    var melting: [(y: Int, x: Int)] = []
    
    queue.append((y, x))
    visited[y][x] = true
    
    var count = 0
    while !queue.isEmpty {
        let f = queue.removeFirst()
        count += 1
        
        var meltingState = false
        for move in moves {
            let nx = f.x + move.x, ny = f.y + move.y
            if arr[ny][nx] == 2 { meltingState = true }
            if arr[ny][nx] == 1 && !visited[ny][nx] {
                visited[ny][nx] = true
                queue.append((ny, nx))
            }
        }
        
        if meltingState {
            melting.append((f.y, f.x))
        }
    }
    return (melting, count)
}

func findCheese() -> (melting: [(y: Int, x: Int)], cheeseCount: Int) {
    var melting: [(y: Int, x: Int)] = []
    var cheeseCount = 0
    for i in 1..<n-1 {
        for j in 1..<m-1 {
            if arr[i][j] == 1 && !visited[i][j] {
                let ret = dfsCheese(i, j)
                melting.append(contentsOf: ret.melting)
                cheeseCount += ret.cheeseCount
            }
        }
    }
    return (melting, cheeseCount)
}

findAir()

while true {
    spendTime += 1
    
    visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    findAir()
    let ret = findCheese()
    
    if ret.melting.count == ret.cheeseCount {
        cheeseCount = ret.cheeseCount
        break
    }
    ret.melting.forEach {
        arr[$0.y][$0.x] = 2
    }
}

print(spendTime)
print(cheeseCount)
