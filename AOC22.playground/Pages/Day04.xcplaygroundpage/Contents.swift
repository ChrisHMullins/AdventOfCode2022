//: [Previous](@previous)

import Foundation


public func day04SolutionPart1() {
    
    
    let pairs = day04Input.components(separatedBy: "\n")
    
    //print(pairs)
    
    var numAssignmentPairs = 0
    
    for pair in pairs {
        
        let ranges = pair.components(separatedBy: ",")
        
        let firstRange = ranges[0]
        
        let firstRangeValues = firstRange.components(separatedBy: "-")
                
        let secondRange = ranges[1]
        
        let secondRangeValues = secondRange.components(separatedBy: "-")
        
        
        if firstRangeValues[0] == secondRangeValues[0] && firstRangeValues[1] == secondRangeValues[1] {
            numAssignmentPairs += 1
            print("\(firstRangeValues), \(secondRangeValues) Number: \(numAssignmentPairs) SAME")
            
        } else {
            
            
            // is the first range inside the second range?
            if Int(firstRangeValues[0]) ?? 0 >= Int(secondRangeValues[0]) ?? 0 && Int(firstRangeValues[1]) ?? 0 <= Int(secondRangeValues[1]) ?? 0 {
                
                print("\(firstRangeValues[0]) is >= \(secondRangeValues[0]) and \(firstRangeValues[1]) <= \(secondRangeValues[1]) ")
                
                numAssignmentPairs += 1
                print("\(firstRangeValues), \(secondRangeValues) Number: \(numAssignmentPairs) FIRST")
                            
            }
            if  Int(secondRangeValues[0]) ?? 0 >= Int(firstRangeValues[0]) ?? 0 && Int(secondRangeValues[1]) ?? 0 <= Int(firstRangeValues[1]) ?? 0 {
                numAssignmentPairs += 1
                print("\(firstRangeValues), \(secondRangeValues) Number: \(numAssignmentPairs) SECOND")
                                        
            }
        }
        
    }
    
    print(numAssignmentPairs)
}

public func day04SolutionPart2() {
    
    
    let pairs = day04Input.components(separatedBy: "\n")
    
    //print(pairs)
    
    var numAssignmentPairs = pairs.count
    
    for pair in pairs {
        
        let ranges = pair.components(separatedBy: ",")
        
        let firstRange = ranges[0]
        
        let firstRangeValues = firstRange.components(separatedBy: "-")
                
        let secondRange = ranges[1]
        
        let secondRangeValues = secondRange.components(separatedBy: "-")
        
        
        
        if  (Int(firstRangeValues[1]) ?? 0 <  Int(secondRangeValues[0]) ?? 0) && (Int(secondRangeValues[0]) ?? 0 > Int(firstRangeValues[0]) ?? 0) {
            numAssignmentPairs -= 1
        }
        
        if  (Int(secondRangeValues[1]) ?? 0 <  Int(firstRangeValues[0]) ?? 0) && (Int(firstRangeValues[0]) ?? 0 > Int(secondRangeValues[0]) ?? 0) {
            numAssignmentPairs -= 1
        }
        
    }
    
    print(numAssignmentPairs)
}

//day04SolutionPart2()
