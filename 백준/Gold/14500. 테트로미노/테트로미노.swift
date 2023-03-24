import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [[Int]]()

for _ in 0..<input[0] {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var ans = 0
for i in 0..<input[0] {
    for j in 0..<input[1] {
        ans = max(tetromino1(i, j),
                  tetromino2(i, j),
                  tetromino3(i, j),
                  tetromino4(i, j),
                  tetromino5(i, j),
                  ans)
    }
}

print(ans)

func tetromino1(_ y: Int, _ x: Int) -> Int {
    var ret = 0
    if x+3 < input[1] {
        var tmp = 0
        for k in 0...3 { tmp += arr[y][x+k] }
        ret = tmp
    }
    if y+3 < input[0] {
        var tmp = 0
        for k in 0...3 { tmp += arr[y+k][x] }
        ret = max(ret, tmp)
    }
    return ret
}

func tetromino2(_ y: Int, _ x: Int) -> Int {
    var ret = 0
    if y+1 < input[0] && x+1 < input[1] {
        for i in 0...1 {
            for j in 0...1 {
                ret += arr[y+i][x+j]
            }
        }
    }
    return ret
}

func tetromino3(_ y: Int, _ x: Int) -> Int {
    var ret = 0
    if y+2 < input[0] && x+1 < input[1] { // L
        var tmp = 0
        for i in 0...2 { tmp += arr[y+i][x] }
        tmp += arr[y][x+1]
        ret = max(tmp, ret)
        
        tmp = tmp - arr[y][x+1] + arr[y+2][x+1]
        ret = max(tmp, ret)
        
        tmp = 0
        for i in 0...2 { tmp += arr[y+i][x+1] }
        tmp += arr[y][x]
        ret = max(tmp, ret)
        
        tmp = tmp - arr[y][x] + arr[y+2][x]
        ret = max(tmp, ret)
    }
    if y+1 < input[0] && x+2 < input[1] { // -ㄱ
        var tmp = 0
        for i in 0...2 { tmp += arr[y][x+i] }
        tmp += arr[y+1][x+2]
        ret = max(tmp, ret)
        
        // -ㄱ의 거울
        tmp = tmp - arr[y+1][x+2] + arr[y+1][x]
        ret = max(tmp, ret)
        
        // |__
        tmp = 0
        for i in 0...2 { tmp += arr[y+1][x+i] }
        tmp += arr[y][x]
        ret = max(tmp, ret)
        
        tmp = tmp - arr[y][x] + arr[y][x+2]
        ret = max(tmp, ret)
    }
    return ret
}

func tetromino4(_ y: Int, _ x: Int) -> Int {
    var ret = 0
    if y+2 < input[0] && x+1 < input[1] {
        for i in 0...1 { ret += arr[y+i][x] }
        for i in 1...2 { ret += arr[y+i][x+1] }
        
        var tmp = 0
        for i in 0...1 { tmp += arr[y+i][x+1] }
        for i in 1...2 { tmp += arr[y+i][x] }
        ret = max(tmp, ret)
    }
    if y+1 < input[0] && x+2 < input[1] {
        var tmp = 0
        for i in 0...1 { tmp += arr[y][x+i] }
        for i in 1...2 { tmp += arr[y+1][x+i] }
        ret = max(tmp, ret)
        
        tmp = 0
        for i in 1...2 { tmp += arr[y][x+i] }
        for i in 0...1 { tmp += arr[y+1][x+i] }
        ret = max(tmp, ret)
    }
    return ret
}

func tetromino5(_ y: Int, _ x: Int) -> Int {
    var ret = 0
    if y+1 < input[0] && x+2 < input[1] {
        for i in 0...2 { ret += arr[y][x+i] }
        ret += arr[y+1][x+1]
        
        var tmp = 0
        for i in 0...2 { tmp += arr[y+1][x+i] }
        tmp += arr[y][x+1]
        ret = max(tmp, ret)
    }
    if y+2 < input[0] && x+1 < input[1] {
        var tmp = 0
        for i in 0...2 { tmp += arr[y+i][x+1] }
        tmp += arr[y+1][x]
        ret = max(tmp, ret)
        
        tmp = 0
        for i in 0...2 { tmp += arr[y+i][x] }
        tmp += arr[y+1][x+1]
        ret = max(tmp, ret)
    }
    return ret
}
