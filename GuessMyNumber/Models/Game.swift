//
//  Game.swift
//  Guess My Number
//
//  Created by bogdanov on 03.06.21.
//

import Foundation

private let maxValue = 100
private var randomTarget: Int {
    Int.random(in: 1 ..< maxValue)
}

struct Game {
    var target = randomTarget

    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []

    init(loadTestDate: Bool = false) {
        if loadTestDate {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 32, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 44, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 434, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 33, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 21, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 5, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 78, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 88, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 99, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 2, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 354, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 49, date: Date()))
        }
    }

    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = randomTarget

        addToLeaderboard(points)
    }

    private mutating func addToLeaderboard(_ points: Int) {
        let leaderboardEntry = LeaderboardEntry(score: points, date: Date())
        leaderboardEntries.append(leaderboardEntry)
        leaderboardEntries.sort { $0.date > $1.date }
    }

    mutating func restart() {
        score = 0
        round = 1
        target = randomTarget
    }

    func points(sliderValue: Int) -> Int {
        maxValue - rowPointsDiff(sliderValue) + getBonusPoints(sliderValue)
    }

    private func getBonusPoints(_ sliderValue: Int) -> Int {
        let diff = rowPointsDiff(sliderValue)
        switch diff {
            case 0:
                return 100
            case 1 ... 2:
                return 50
            default:
                return 0
        }
    }

    private func rowPointsDiff(_ sliderValue: Int) -> Int {
        abs(target - sliderValue)
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
