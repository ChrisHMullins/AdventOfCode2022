
import Foundation

public func day08Solution() {

    var visibleTreeCount = 0

    //store grid
    var forest = day08InputTest.components(separatedBy: "\n")
    var forestGrid = [[Int]]()

    for row in forest {
        let stringRow = Array(row)
        let intRow = stringRow.map { Int("\($0)")! }
        forestGrid.append(intRow)
    }

    //print(forestGrid)
    var rowCount = 0
    for row in forestGrid {

        var treeCount = 0
        for tree in row { //will go through every tree row by row
            var vslice = [Int]()
            for row in forestGrid {
                vslice.append(row[treeCount])
            }

            let isVisibleH = isVisible(row: row, index: treeCount)
            let isVisibleV = isVisible(row: vslice, index: rowCount)

            if  isVisibleV || isVisibleH {
                visibleTreeCount += 1
            }

            print("this tree = (\(treeCount), \(rowCount)) of height \(tree) visV: \(isVisibleV) visH: \(isVisibleH) Total trees: \(visibleTreeCount)")
            treeCount += 1
        }

        rowCount += 1
    }

    print("\(visibleTreeCount)")
}

public func isVisible(row:[Int], index:Int) -> Bool {

    //print("row \(row) index \(index)")

    if index == 0 || index == row.count - 1 {
        //print("Edge")
        return true
    }

    var leftVis = true
    var rightVis = true

    var count = 0
    for tree in row {
        if count < index {
            if tree >= row[index] {

                //print("left tree \(tree) > tree: \(row[index]) count:\(count)")

                leftVis = false
            }
        }

        if count > index {
            if tree >= row[index] {

                //print("right tree \(tree) > tree: \(row[index]) count:\(count)")

                rightVis = false
            }
        }

        count += 1
    }

    return leftVis || rightVis ? true : false
}

//day08Solution()

public func day08SolutionPart2() {
    var bestViewScore = 0

    //store grid
    var forest = day08Input.components(separatedBy: "\n")
    var forestGrid = [[Int]]()

    for row in forest {
        let stringRow = Array(row)
        let intRow = stringRow.map { Int("\($0)")! }
        forestGrid.append(intRow)
    }

    //print(forestGrid)

    var rowCount = 0
    for row in forestGrid {

        var treeCount = 0
        for tree in row { //will go through every tree row by row
            var vslice = [Int]()
            for row in forestGrid {
                vslice.append(row[treeCount])
            }

            let scoreH = viewScore(row: row, index: treeCount)
            let scoreV = viewScore(row: vslice, index: rowCount)

            let viewScore = scoreH * scoreV

            bestViewScore = viewScore  > bestViewScore ? viewScore : bestViewScore

            //print("this tree = (\(treeCount), \(rowCount)) of height \(tree) visV: \(scoreV) visH: \(scoreH) score: \(viewScore) best score: \(bestViewScore)")
            treeCount += 1
        }

        rowCount += 1
    }

    print("\(bestViewScore)")

}

public func viewScore(row:[Int], index:Int) -> Int {

    //print("row \(row) index \(index)")

    var leftScore = Int()
    var rightScore = Int()

    var counter = 0

    let leftTo = index - 1
    if leftTo > 0 {

        for i in 0...leftTo {
            if row[i] < row[index] {
                counter  += 1
            }else {
                counter = 1
            }
            //print("left \(counter) \(row[i]) \(row[index])")
        }
    }

    leftScore = counter

    counter = 0

    let rightFrom = index + 1 //4
    let count = row.count - 1 //4
    if rightFrom >= 0  {

        if rightFrom == count {
            counter = 1
        } else {

            if rightFrom > count {
                counter = 0
                //print("right0 \(counter) \(rightFrom) OOB count")

            } else  {

                for i in rightFrom...count {
                    if row[i] < row[index] {
                        counter  += 1
                    }else {
                        counter += 1
                        //print("right1 \(counter) \(row[i]) \(row[index])")
                        break
                    }
                    //print("right 2\(counter) \(row[i]) \(row[index])")
                }
            }
        }
    }

    rightScore = counter

    //print("row: \(row) index: \(index) left score: \(leftScore) right score: \(rightScore)")

    return leftScore * rightScore
}

day08SolutionPart2()
