import Foundation

public func day05SolutionPart1() {
    
    var stacks = setupStacks()
    let moves = day05Input.components(separatedBy: "\n")
    
    for move in moves {

        //move 1 from 2 to 1
        let moveSplit = move.components(separatedBy: " ")
        
        let containersToMove = Int(moveSplit[1]) ?? 0
        let fromStack = (Int(moveSplit[3]) ?? 0) - 1
        let toStack = (Int(moveSplit[5]) ?? 0) - 1

        //print("Move \(containersToMove) from \(fromStack+1) to \(toStack+1)")

        for _ in 1...Int(containersToMove) {
            let containerContents = stacks[fromStack].popLast() ?? ""

            stacks[toStack].append(containerContents)

            //print("Moving \(containerContents)")
        }
        
    }
    var topString = ""
    for stack in stacks {
        topString += stack.last ?? " "
    }
    print(topString)
}

public func setupStacks() -> [[String]] {
    /*
     
                           [R] [J] [W]
               [R] [N]     [T] [T] [C]
   [R]         [P] [G]     [J] [P] [T]
   [Q]     [C] [M] [V]     [F] [F] [H]
   [G] [P] [M] [S] [Z]     [Z] [C] [Q]
   [P] [C] [P] [Q] [J] [J] [P] [H] [Z]
   [C] [T] [H] [T] [H] [P] [G] [L] [V]
   [F] [W] [B] [L] [P] [D] [L] [N] [G]
    1   2   3   4   5   6   7   8   9

   */
       
    var stacks = [[String]]()
    
    var stack1 = ["F","C","P","G","Q","R"]
    var stack2 = ["W","T","C","P"]
    var stack3 = ["B","H","P","M","C"]
    var stack4 = ["L","T","Q","S","M","P","R"]
    var stack5 = ["P","H","J","Z","V","G","N"]
    var stack6 = ["D","P","J"]
    var stack7 = ["L","G","P","Z","F","J","T","R"]
    var stack8 = ["N","L","H","C","F","P","T","J"]
    var stack9 = ["G","V","Z","Q","H","T","C","W"]
    
    stacks.append(stack1)
    stacks.append(stack2)
    stacks.append(stack3)
    stacks.append(stack4)
    stacks.append(stack5)
    stacks.append(stack6)
    stacks.append(stack7)
    stacks.append(stack8)
    stacks.append(stack9)
    
    
    return stacks
}

public func setupStacksTest() -> [[String]] {
    /*
             
            [D]
        [N] [C]
        [Z] [M] [P]
         1   2   3

   */
       
    var stacks = [[String]]()
    var stack1 = ["Z","N"]
    var stack2 = ["M","C","D"]
    var stack3 = ["P"]
    stacks.append(stack1)
    stacks.append(stack2)
    stacks.append(stack3)
    return stacks
}

public func day05SolutionPart2() {

    var stacks = setupStacks()
    let moves = day05Input.components(separatedBy: "\n")

    for move in moves {

        //move 1 from 2 to 1
        let moveSplit = move.components(separatedBy: " ")

        let containersToMove = Int(moveSplit[1]) ?? 0
        let fromStack = (Int(moveSplit[3]) ?? 0) - 1
        let toStack = (Int(moveSplit[5]) ?? 0) - 1

        //print("Move \(containersToMove) from \(fromStack+1) to \(toStack+1)")

        var craneContents = [String]()

        for _ in 1...Int(containersToMove) {
            craneContents.append(stacks[fromStack].popLast() ?? "")

        }

        //put them down
        for _ in craneContents {
            stacks[toStack].append(craneContents.popLast() ?? "")
        }



    }
    var topString = ""
    for stack in stacks {
        topString += stack.last ?? " "
    }
    print(topString)

}

//day05SolutionPart2()

