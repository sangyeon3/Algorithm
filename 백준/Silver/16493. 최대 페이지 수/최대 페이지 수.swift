import Foundation

func input() -> (Int, Int) {
    let i = readLine()!.split{$0 == " "}.map{Int($0)!}
    return (i[0], i[1])
}

let (N, M) = input()
var book = [(day: Int, page: Int)]()
for _ in 0..<M { book.append(input()) }

var combi = [Int]()
var visited = [Bool](repeating: false, count: M+1)
var ans = 0

func checkAns() {
    var (day, page) = (0, 0)
    for i in combi {
        day += book[i].day
        page += book[i].page
    }
    if day <= N {
        ans = max(ans, page)
    }
}

func sol(_ idx: Int) {
    checkAns()
    if combi.count == M {
        return
    }
    
    for i in idx..<M {
        if visited[i] { continue }
        visited[i] = true
        combi.append(i)
        sol(i+1)
        combi.removeLast()
        visited[i] = false
    }
}

sol(0)

print(ans)
