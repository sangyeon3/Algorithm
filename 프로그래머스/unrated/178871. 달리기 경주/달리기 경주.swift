import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var rankings: [String: Int] = [:]
    for i in 0..<players.count {
        rankings[players[i]] = i
    }
    
    var players_ = players
    callings.forEach { calling in
        guard let prevRanking = rankings[calling] else { return }
        let frontPlayer = players_[prevRanking-1]
        players_[prevRanking] = frontPlayer
        players_[prevRanking-1] = calling
        rankings[calling] = prevRanking-1
        rankings[frontPlayer] = prevRanking
    }
    
    return players_
}