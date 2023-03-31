import Foundation

func solution(_ plans:[[String]]) -> [String] {
    var plans = plans.map { (name: $0[0], start: stringToDate($0[1]), playtime: Int($0[2])!)}
    plans.sort{ $0.start < $1.start }

    var stack = [(name: String, start: Date, playtime: Int)]()
    var ans = [String]()
    var current = plans[0]
    
    var i = 1
    while i < plans.count {
        let endtime = current.start.addingTimeInterval(Double(current.playtime) * 60)
        if plans[i].start > endtime {
            ans.append(current.name)
            if !stack.isEmpty {
                let latest = stack.removeLast()
                current = (latest.name, endtime, latest.playtime)
                continue
            } 
        } else if plans[i].start == endtime {
            ans.append(current.name)
        } else {
            let remainTime = Int(endtime.timeIntervalSince(plans[i].start)/60)
            stack.append((current.name, current.start, remainTime))
        }
        current = plans[i]
        i += 1
    }
    ans.append(current.name)
    while !stack.isEmpty {
        ans.append(stack.removeLast().name)
    }
    
    return ans
}

func stringToDate(_ str: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.date(from: str)!
}