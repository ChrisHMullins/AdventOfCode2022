import UIKit
import Foundation

public var elfTotals = [Int]()

public func day1Solution() {
    
    print("Day1 =========")
    
    elfTotals = [Int]()
    
    let elves = day1Input.components(separatedBy: "\n\n") 
    
    for elf in elves {
        
        let pack = elf.components(separatedBy: "\n")
        
        var totalCalories = Int()
        
        for calories in pack {
            totalCalories += Int(calories) ?? 0
        }
        
        //print(totalCalories)
        
        elfTotals.append(totalCalories)
    }
    
    print("Max Calories an elf is carrying: \(elfTotals.max() ?? 0)")

    //Part 2
    elfTotals.sort(by: >)
    //let firstThree = elfTotals[0...2]
    let firstThreeTotal = elfTotals[0] + elfTotals[1] + elfTotals[2]

    print("The total of the three elves carrying the most calories: \(firstThreeTotal)")
    
    
}

day1Solution()

