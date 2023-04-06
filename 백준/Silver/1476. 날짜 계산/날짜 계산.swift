import Foundation

var date = readLine()!.split{ $0 == " " }.map { Int($0)! }
var year = 0
var scopes = [15, 28, 19]

while date[0] != date[1] || date[1] != date[2] {
    let min = date.enumerated().min { $0.element < $1.element }!.element
    year += min
    for i in 0..<3 {
        if date[i] == min {
            date[i] = scopes[i]
        } else {
            date[i] -= min
        }
    }
}

year += date[0]
print(year)
