//: [Previous](@previous)

import Foundation

public var score = Int()

public func day2Solution() {

    print("Day2 =========")
    
    
    let guide = day2Input.components(separatedBy: "\n")
    
    for game in guide {
        
        let opponent = game[game.index(game.startIndex, offsetBy: 0)]
        
        let player = game[game.index(game.startIndex, offsetBy: 1)]
        
        //score(String(opponent), String(player))
        score2(String(opponent), String(player))
        
    }
    
    print("Score: \(score)")
}

func score(_ opponent: String,_ player: String) {
    
    //print("Opponent: \(opponent) Player: \(player)")
    
    var roundScore = 0
    
    switch player {
    case "X":
        roundScore += 1
    case "Y":
        roundScore += 2
    case "Z":
        roundScore += 3
    default:
        break
    }
    
    switch (opponent + player) {
    case "AX", "BY", "CZ":
        //tie
        roundScore += 3
    case "AY", "BZ", "CX":
        //win
        roundScore += 6
    default:
        break
    }
    
    //print("Round Score: \(roundScore)")
    score += roundScore
    
}

func score2(_ opponent: String,_ player: String) {
    
    //print("Opponent: \(opponent) Player: \(player)")
    
    var roundScore = 0
    
    switch player {
    case "X":
        roundScore += 0
    case "Y":
        roundScore += 3
    case "Z":
        roundScore += 6
    default:
        break
    }
    
    
    /*
     
     A = Rock
     B = Paper
     C = Scissors
     
     X = Lose
     Y = Draw
     Z = Win
     
     Rock = 1
     Paper = 2
     Scissors = 3
     
     
     */
    
    switch (opponent + player) {
    case "AY":
        //draw, rock-rock
        roundScore += 1
    case "AZ":
        //win, rock-paper
        roundScore += 2
    case "AX":
        //win, rock-scissors
        roundScore += 3
    
    case "BY":
        //draw, paper-paper
        roundScore += 2
    case "BZ":
        //win, paper-Scissors
        roundScore += 3
    case "BX":
        //win, paper-rock
        roundScore += 1
        
    case "CY":
        //draw, Scissors-Scissors
        roundScore += 3
    case "CZ":
        //win, Scissors-rock
        roundScore += 1
    case "CX":
        //win, Scissors-Paper
        roundScore += 2

        
    default:
        break
    }
    
    //print("Round Score: \(roundScore)")
    score += roundScore
    
}
    
//day2Solution()

