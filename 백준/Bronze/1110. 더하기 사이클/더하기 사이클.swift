import Foundation

let N = Int(readLine()!)!
var new = (N%10)*10 + (N/10+N%10)%10
var count = 1
while new != N {
    new = (new%10)*10 + (new/10+new%10)%10
    count += 1
}
print(count)