import Foundation

let n = Int(readLine()!)!
let buildings = readLine()!.split(separator: " ").map{Int($0)!}

var count = [Int](repeating: 0, count: n)
for i in 0..<n-1 {
    count[i] += 1
    count[i+1] += 1
    if i >= n-2 { continue }
    
    for j in i+2..<n {
        let a: Double = Double(buildings[j] - buildings[i]) / Double(j-i)
        let b = Double(buildings[i]) - a * Double(i+1)
        
        var state = true
        for k in i+1..<j {
            let y = a * Double(k+1) + b
            if Double(buildings[k]) >= y {
                state = false
                break
            }
        }
        
        if state {
            count[i] += 1
            count[j] += 1
        }
    }
}

print(count.max()!)
