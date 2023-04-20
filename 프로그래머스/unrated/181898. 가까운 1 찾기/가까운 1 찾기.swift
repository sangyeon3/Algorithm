import Foundation

func solution(_ arr:[Int], _ idx:Int) -> Int {
    for i in 0..<arr.count where i >= idx {
        if arr[i] == 1 { return i }
    }
    return -1
}