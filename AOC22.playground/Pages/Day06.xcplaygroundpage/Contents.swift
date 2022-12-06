import Foundation

public func day06SolutionPart1() {

    //Test samples
    //let sampleString = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"  // 7
    //let sampleString = "bvwbjplbgvbhsrlpgdmjqwftvncz" // 5
    //let sampleString = "nppdvjthqldpwncqszvftbrmjlhg"  // 6
    //let sampleString = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" // 10
    //let sampleString = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" // 11

    //let characters = Array(sampleString)
    let characters = Array(day06Input)

    //part 1
    let packetMarker = markerIndex(characters: characters, length: 4)

    //part 2
    let messageMarker = markerIndex(characters: characters, length: 14)

    print("packetMarker: \(packetMarker)" )
    print("messageMarker: \(messageMarker)")
}

public func markerIndex(characters:[Character], length:Int) -> Int {

    //print(characters)

    for index in 0...characters.count {
        if index >= characters.count - 1 {
            print("Out of bounds")
            break
        }

        var set = ""
        let counter = length - 1

        for i in 0...counter {
            set += "\(characters[index + i])"
        }

        var isMatch = true
        for c in Array(set) {
            let num = set.filter{ $0 == c}.count
            if num > 1 {
                isMatch = false
                break
            }
            //print("\(c) \(num) \(isMatch)")
        }

        if isMatch {
            print("\(index) \(set)")
            return index + length
        }
    }

    return 0
}

day06SolutionPart1()

