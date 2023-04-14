import Foundation

for _ in 0..<(Int(readLine()!)!) {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    let (N, M) = (input[0], input[1])
    for _ in 0..<M {
        _ = readLine()!.split{$0 == " "}.map{Int($0)!}
    }
    print(N-1)
}
