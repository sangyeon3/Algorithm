import Foundation

var charCount: [String: Int] = [:]

let input = readLine()!
let length = input.count

input.forEach {
    charCount[String($0)] = (charCount[String($0)] ?? 0) + 1
}

let alphaNum = 65
var ans = [String](repeating: "", count: length)
var index = 0
var state = true
for i in 0..<26 {
    guard let unicode = UnicodeScalar(alphaNum + i)else { break }
    let alphabet = String(unicode)
    guard var count = charCount[alphabet] else { continue }
    
    if count % 2 == 1 && (length % 2 == 0 || ans[length / 2] != "") {
        state = false
        break
    }
    
    if count % 2 == 1  && ans[length/2] == "" {
        ans[length/2] = alphabet
        count -= 1
    }
    
    while count > 0 {
        ans[index] = alphabet
        ans[length-index-1] = alphabet
        count -= 2
        index += 1
    }
}

if state {
    print(ans.reduce("", +))
} else {
    print("I'm Sorry Hansoo")
}
