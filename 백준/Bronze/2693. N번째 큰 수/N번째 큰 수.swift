import Foundation
for _ in 0..<Int(r())! {
    print(r().split{$0==" "}.map{Int($0)!}.sorted(by: >)[2])
}
func r()->String{readLine()!}