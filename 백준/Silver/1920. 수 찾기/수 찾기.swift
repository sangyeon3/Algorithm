import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
let m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{ Int($0)! }

func binarySearch(_ number: Int) -> Bool {
    var l = 0, r = n-1
    
    while l < r {
        let mid = (l+r) / 2
        if arr[mid] == number { return true }
        if arr[mid] < number { l = mid + 1 }
        else { r = mid }
    }
    return arr[l] == number
}

var ans = ""
for number in numbers {
    ans += binarySearch(number) ? "1\n" : "0\n"
}
print(ans)