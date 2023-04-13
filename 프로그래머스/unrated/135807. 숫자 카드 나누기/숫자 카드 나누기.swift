import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a, b = b
    if a < b {
        let tmp = a
        a = b 
        b = tmp
    }
    let c = a / b
    let r = a % b
    if r == 0 { return b }
    return gcd(b, r)
}

func findGCD(_ arr: [Int]) -> Int {
    var g = arr[0]
    for i in 1..<arr.count {
        g = gcd(arr[i], g)
    }
    return g
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    var g1 = findGCD(arrayA)
    var g2 = findGCD(arrayB)
    
    var ans = 0
    if g1 != 1 && arrayB.filter{ $0 % g1 == 0 }.isEmpty {
        ans = g1
    } 
    if g2 != 1 && arrayA.filter{ $0 % g2 == 0 }.isEmpty {
        ans = max(ans, g2)
    }
    
    return ans
}