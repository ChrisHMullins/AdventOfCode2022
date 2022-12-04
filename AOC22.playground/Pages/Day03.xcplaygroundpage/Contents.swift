//: [Previous](@previous)

import Foundation

var totalPriority = 0

public func part1() {
    
    for pack in day03Input.components(separatedBy: "\n") {
        
        let numberOfItems = pack.count
        //print(numberOfItems)
        
        let firstString = pack.prefix(numberOfItems/2)
        
        let secondString = pack.suffix(numberOfItems/2)
        
        //print("\(firstString) \(secondString)")
    
        for letter in firstString {
            if secondString.contains(letter) {
                scoreLetter("\(letter)")
                break
            }
        }
        
        print(totalPriority)
    }
    
}


public func part2() {
    
    
    var groups = [[String]]()
    
    var counter = 0
    
    var thisGroup = [String]()
    
    for pack in day03Input.components(separatedBy: "\n") {
        //print(counter)
        
        thisGroup.append(pack)
        counter += 1
        
        if counter == 3 {
            groups.append(thisGroup)
            thisGroup = [String]()
            counter = 0
        }
        
    }
    
    //print(groups)
    
    for group in groups {
        let string1 = group[0]
        let string2 = group[1]
        let string3 = group[2]
        
        for letter in string1 {
            if string2.contains(letter) {
                if string3.contains(letter) {
                    scoreLetter("\(letter)")
                    break
                }
            }
        }
    }
    
    print(totalPriority)
}

part2()

public func scoreLetter(_ letter:String) {
    
    var counter = 0
    
    let startChar = Unicode.Scalar("a").value
    let endChar = Unicode.Scalar("z").value

    for alphabet in startChar...endChar {
        
        counter += 1

        if let char = Unicode.Scalar(alphabet) {
            if char == Unicode.Scalar(letter)  {
                //print(char)
                
                totalPriority += counter
            }
            
        }
    }
    
    // Same code with A to Z
    
    let startChar2 = Unicode.Scalar("A").value
    let endChar2 = Unicode.Scalar("Z").value

    for alphabet in startChar2...endChar2 {
        
        counter += 1

        if let char = Unicode.Scalar(alphabet) {
            if char == Unicode.Scalar(letter)  {
                //print(char)
                
                totalPriority += counter
            }
            
        }
    }
}





//: [Next](@next)
