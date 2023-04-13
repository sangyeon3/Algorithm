import Foundation

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let (N, K) = (input[0], input[1])
var stuffs = [(w: Int, v: Int)]([(0, 0)])
for _ in 0..<N {
    let stuff = readLine()!.split{$0 == " "}.map{Int($0)!}
    stuffs.append((stuff[0], stuff[1]))
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: K+1), count: N+1)
for i in 1...N {
    for w in 0...K {
        if stuffs[i].w > w {
            dp[i][w] = dp[i-1][w]
        } else {
            dp[i][w] = max(dp[i-1][w], dp[i-1][w-stuffs[i].w] + stuffs[i].v)
        }
    }
}
print(dp[N][K])
