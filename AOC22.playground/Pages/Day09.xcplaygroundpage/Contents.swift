import Foundation

public let day09InputTest = """
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
"""

public let day09Part2InputTest = """
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20
"""

public let day09Part2bInputTest = """
R 5
U 8
"""

var input = day09Input.components(separatedBy: "\n")
var moves  = input.map { $0.components(separatedBy: " ") }

var startLoc = Point(x: 100, y:100)
var headLoc = startLoc
var tailLoc = startLoc

var tailLocations: Set = [tailLoc]

public func part1() {
    
    for move in moves {
        
        var spacesCount = Int(move[1]) ?? 0
        
        for i in 1...spacesCount {
            
            var newHeadLoc = movePoint(headLoc, move[0])
            
            if shouldMove(newHeadLoc,tailLoc) {
                //move the tail to the current head loc
                tailLoc = headLoc
                
                //Add the new tail location to the list
                tailLocations.insert(tailLoc)
                //print(tailLoc)
            }
            
            headLoc = newHeadLoc
            //print("space move = \(i) headloc: \(headLoc), tailloc: \(tailLoc)")
        }
        
    }
    
    print(tailLocations.count)
}

public func movePoint(_ start: Point, _ direction: String) -> Point {
    
    var newPoint = Point(x:0,y:0)
    
    switch direction {
    case "R":
        newPoint = Point(x: start.x + 1, y: start.y)
    case "L":
        newPoint = Point(x: start.x - 1, y: start.y)
    case "D":
        newPoint = Point(x: start.x, y: start.y - 1)
    case "U":
        newPoint = Point(x: start.x, y: start.y + 1)
    default:
        break
    }
    

    return newPoint
}


public func shouldMove(_ head: Point, _ tail: Point) -> Bool {
    
    var shouldMove = false
    
    if head.x == tail.x && head.y == tail.y {
        shouldMove = false
    }
    
    if abs(head.x - tail.x) > 1 {
        shouldMove = true
    }
    
    if abs(head.y - tail.y) > 1 {
        shouldMove = true
    }
    //print("shouldMove: \(shouldMove)")
    return shouldMove
}

public struct Point {
    var x: Int
    var y: Int
}

extension Point: Hashable {
    public var hashValue: Int {
        return x.hashValue ^ y.hashValue
    }

    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Point: CustomStringConvertible {
    public var description: String {
        return "(\(x),\(y))"
    }
}

public func part2() {
    
    var rope = [Point]()
    
    var segments = 10
    
    for _ in 1...segments {
        rope.append(startLoc)
    }
    
    //take each move
    for move in moves {
        
        var spacesCount = Int(move[1]) ?? 0
        
        //print("there are \(spacesCount) space in this move")
    
        for i in 1...spacesCount {
            //print("======= Move \(move) space \(i) of \(spacesCount) ======")
                    
            rope[0] = movePoint(rope[0], move[0])  // this will be the new location of the head of the rope
            
            for (index, segment) in rope.enumerated() { //for each part of the rope
                
                //print("Index: \(index), Segment: \(segment) ")
                
                if index == 0 {
                    continue
                }
                
                if shouldMove(rope[index], rope[index - 1]) {
                    
                    rope[index] = movePoint2(rope[index], rope[index - 1])
                    

                    if index + 1 == rope.count {
                        tailLocations.insert(rope[index])
                        //print("moved the tail \(rope[index]) to \(previousSegmentBefore) Move \(move) space \(i) of \(spacesCount)")
                    }
                }
                     
            }

            //print("move: \(move) \(rope)")
        }
           
    }
    print(tailLocations.count)
}

public func movePoint2(_ point1: Point, _ point2: Point) -> Point {
    
    var x = point1.x
    var y = point1.y
    
    if point2.x > point1.x {
        x += 1
    }
    
    if point2.y > point1.y {
        y += 1
    }
    
    if point2.x < point1.x {
        x -= 1
    }
    
    if point2.y < point1.y {
        y -= 1
    }

    
    return Point(x: x, y: y)
    
    
    
    
    
}



var timestart = DispatchTime.now()
//part1()

part2()

var timeend = DispatchTime.now()

var nanoTime = timeend.uptimeNanoseconds - timestart.uptimeNanoseconds
var secondsTime = Double(nanoTime) / 1_000_000

print("time: \(secondsTime)ms")
