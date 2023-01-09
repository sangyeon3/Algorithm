import Foundation

let input = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
print(arr.first!, terminator: " \(arr.last!)")

