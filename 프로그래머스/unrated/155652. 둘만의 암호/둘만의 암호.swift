import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    // a~z에서 skip은 제외
    var alphabets = Array("abcdefghijklmnopqrstuvwxyz")
    let skips = Array(skip)
    alphabets = alphabets.filter { !skips.contains($0) }
    
    let answer = s.map { (char: Character) -> String in
        let currentIndex = alphabets.firstIndex(of: char)!
        let nextIndex = (currentIndex + index) % alphabets.count
        return String(alphabets[nextIndex])
    }
    
    return answer.joined(separator: "")
}