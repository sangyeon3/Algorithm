import Foundation

let arr = readLine()!.split(separator: " ").map{ Int($0)! }

func myFunc(_ n: Int, _ k: Int) -> Int {
    if k == 1 || k == n-1 { return n }
    if k == 0 || k == n { return 1 }
    return myFunc(n-1, k-1) + myFunc(n-1, k)
}

print(myFunc(arr[0] - 1, arr[1] - 1))
