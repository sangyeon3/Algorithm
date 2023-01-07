import Foundation

while true {
    let number = readLine()!
    if number == "0" { break }
    
    let length = number.count
    var flag = true
    for i in 0..<length {
        if number[i] != number[length-1-i] {
            flag = false
            break
        }
    }
    if flag { print("yes") }
    else { print("no") }
}

extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}
