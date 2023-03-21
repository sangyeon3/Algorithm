import Foundation

struct Queue<T> {
    private var queue = [T?]()
    private var index = 0
    
    var count: Int {
        queue.count - index
    }
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    mutating func push(_ data: T) {
        queue.append(data)
    }
    
    mutating func pop() -> T? {
        guard index < queue.count, let ret = queue[index] else { 
            return nil
        }
        queue[index] = nil
        index += 1
        
        if index > 5000 {
            queue.removeFirst(index)
            index = 0
        }
        
        return ret
    }
}

var moves = [(1, 0), (0, 1), (-1, 0), (0, -1)]
var arr = [[String]]()
var visited = [[Int]]()
var row = 0, column = 0

func bfs(_ y: Int, _ x: Int) {
    var queue = Queue<(y: Int, x: Int)>()
    queue.push((y, x))
    visited[y][x] = 0
    
    while !queue.isEmpty {
        guard let front = queue.pop() else { return }
        
        for move in moves {
            var nx = front.x + move.1
            var ny = front.y + move.0
            if !isAccessible(ny, nx) { continue }
            
            while isAccessible(ny, nx) {
                ny += move.0
                nx += move.1
            }
            ny -= move.0
            nx -= move.1
            if visited[ny][nx] != -1 { continue }

            visited[ny][nx] = visited[front.y][front.x] + 1
            queue.push((ny, nx))
        }
    }
}

func solution(_ board:[String]) -> Int {
    
    arr = board.map { $0.map { String($0) } }
    row = arr.count
    column = arr[0].count
    var start = (-1, -1), end = (-1, -1)
    visited = [[Int]](repeating: [Int](repeating: -1, count: column), count: row)
    
    for i in 0..<row {
        for j in 0..<column {
            if arr[i][j] == "R" {
                start = (i, j)
            } else if arr[i][j] == "G" {
                end = (i, j)
            } else if arr[i][j] == "D" {
                continue
            } else if i == 0 || j == 0 || i == row - 1 || j == column - 1 {
                arr[i][j] = "0"
            } else if isAroundDoor(i, j) {
                arr[i][j] = "0"
            } else {
                arr[i][j] = "1"
            }
        }
    }
    
    bfs(start.0, start.1)
    return visited[end.0][end.1]
}

func isAroundDoor(_ y: Int, _ x: Int) -> Bool {
    for move in moves {
        let ny = y + move.0, nx = x + move.1
        if ny < 0 || nx < 0 || ny >= row || nx >= column { continue }
        if arr[y + move.0][x + move.1] == "D" { return true }
    }
    return false
}

func isAccessible(_ y: Int, _ x: Int) -> Bool {
    y >= 0 && x >= 0 && y < row && x < column && arr[y][x] != "D"
}