import Foundation

let part1 = readLine()!.map{ Int(String($0))! }
let part2 = readLine()!.map{ Int(String($0))! }

var ans = part1.count + part2.count

func isAvailable(_ a: Int, _ b: Int) -> Bool {
    return (a != b) || (a==1 && b==1)
}

for i in 0..<part1.count {
    var cur = i, j = 0
    var state = true
    
    while cur < part1.count && j < part2.count {
        if isAvailable(part1[cur], part2[j]) {
            cur += 1
            j += 1
        } else {
            state = false
            break
        }
    }
    
    if state {
        if j == part2.count {
            ans = min(ans, part1.count)
        } else {
            ans = min(ans, part1.count + part2.count - (part1.count - i))
        }
    }
}

for j in 0..<part2.count {
    var cur = j, i = 0
    var state = true
    
    while cur < part2.count && i < part1.count {
        if isAvailable(part1[i], part2[cur]) {
            cur += 1
            i += 1
        } else {
            state = false
            break
        }
    }
    
    if state {
        if i == part1.count {
            ans = min(ans, part2.count)
        } else {
            ans = min(ans, part1.count + part2.count - (part2.count - j))
        }
    }
}

print(ans)
