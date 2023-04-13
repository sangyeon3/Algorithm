import Foundation

let N = Int(readLine()!)!
if N < 3 {
    print(N)
} else {
    var arr = [Int](repeating: 0, count: 3)
    arr[0] = 1
    arr[1] = 2
    for _ in 3...N {
        arr[2] = (arr[1] + arr[0]) % 10
        arr[0] = arr[1]
        arr[1] = arr[2]
    }
    print(arr[2])
}
