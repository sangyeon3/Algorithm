import Foundation

let n = Int(readLine()!)!
let buildings = readLine()!.split(separator: " ").map{Int($0)!}

var count = [Int](repeating: 0, count: n)
for i in 0..<n-1 {
    count[i] += 1
    count[i+1] += 1
    if i >= n-2 { continue }
    
    var maxKi = Double(buildings[i+1] - buildings[i])
    for j in i+2..<n {
        let ki: Double = Double(buildings[j] - buildings[i]) / Double(j-i)
        
        if maxKi < ki {
            maxKi = ki
            count[i] += 1
            count[j] += 1
        }
    }
}

print(count.max()!)
