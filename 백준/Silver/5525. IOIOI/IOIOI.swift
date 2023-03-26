import Foundation

let (N, M) = (Int(readLine()!)!, Int(readLine()!)!)
let S = readLine()!.map{ String($0) }
let length = 2*N+1

var index = 0
var ans = 0

while (index + length - 1) < M {
    var state = true
    for i in 0..<length {
        if !(i % 2 == 0 && S[index+i] == "I") && !(i % 2 == 1 && S[index+i] == "O") {
            if i == 0 { index += 1 }
            else { index += i }
            state = false
            break
        }
    }
    
    if state {
        ans += 1
        index += length
        
        while (index + 1) < M {
            if S[index] == "O" && S[index+1] == "I" {
                ans += 1
                index += 2
            } else {
                break
            }
        }
    }
}

print(ans)
