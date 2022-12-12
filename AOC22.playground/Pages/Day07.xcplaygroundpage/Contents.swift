import Foundation


/*

 Incomplete solution. Error possibly in how I mapped the nodes?
 
 
 */

let inputData = day07Input.components(separatedBy: "\n")

var totalSize = 0

func day07Solution() {

    let structure = buildFileSystemStructure()
    print(structure)

    var _ = calculateSizes(node: structure)

    print("total size: \(totalSize)")

    //42293149
    //2338879 is too high
    //1508650 is wrong
    //1443288 is too low
    //1197232



}

func calculateSizes(node: Node) -> Int {
    var size = 0
    for dir in node.children {
        var folderSize = 0

        for file in dir.files {
            folderSize += file.size
        }
        size += folderSize

        size += calculateSizes(node: dir)

        if size <= 100000 {
            totalSize += size
        }
    }
    print("\(node.name) \(size)")
    return size
}

//func calculateSizes(node: Node) -> Int {
//
//    //print("current node: \(node.name)")
//
//    var size = 0
//    var currentSubfolderTotal = 0
//    var currentParentName = node.parent?.name
//
//
//    for dir in node.children {
//
//        var folderSize = 0
//
//        for file in dir.files {
//            folderSize += file.size
//        }
//
//        var subFolderSize = calculateSizes(node: dir)
//
//        var myParent = dir.parent?.name ?? ""
//
//        if myParent == currentParentName {
//
//            print("they match \(dir.parent?.name) \(currentParentName)")
//
//            currentSubfolderTotal = folderSize + subFolderSize
//
//        } else {
//
//            print("reset \(dir.parent?.name) \(currentParentName)")
//            currentParentName = dir.parent?.name ?? ""
//
//            subFolderSize = currentSubfolderTotal
//            currentSubfolderTotal = 0
//        }
//
//
//        size = folderSize + subFolderSize
//
//
//
//        if size <= 100000 {
//            totalSize += size
//        }
//
//        print("\(dir.name) size: \(size), folderSize: \(folderSize), subfoldersize: \(subFolderSize), current sub total: \(currentSubfolderTotal) parent: \(dir.parent?.name ?? "NONE"), totalsize: \(totalSize)")
//
//    }
//
//    return size
//}



func buildFileSystemStructure() -> Node {

    var tree = Node(name: "/")

    var currentNode = tree

    for line in inputData {
        //print(line)

        if line.contains("$ cd") {
            switch line {
            case "$ cd /":
                currentNode = tree

            case "$ cd ..":
                if currentNode.name == "/" {
                    //print("Already Home")
                } else {
                    if let parent = currentNode.parent {
                        currentNode = parent
                    }
                }
            default:
                let name = line.replacingOccurrences(of: "$ cd ", with: "")
                var child = Node(name: name)
                //print("add a child to \(currentNode.name)")
                if currentNode.name == "/" {
                    tree.add(child: child )
                } else {
                    currentNode.add(child: child)
                }
                currentNode = child
            }
        }

        if String(line.prefix(1)).isNumber {
            // this is a file
            let fileSize = line.components(separatedBy: " ")[0]
            let fileName = line.components(separatedBy: " ")[1]

            if let fileSize = Int(fileSize) {
                let file:File = File(name: fileName, size: fileSize)
                currentNode.files.append(file)
                //print("add a file to \(currentNode.name)")
            }


        }


    }

    return tree

}

day07Solution()

class Node {
    var name: String
    var files: [File]

    var children: [Node] = []
    weak var parent: Node?

    init(name: String) {
        self.name = name
        self.files = [File]()
    }

    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(name) \(files.count)"

        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

class File {
    var name: String
    var size: Int

    init(name: String, size: Int) {
        self.name = name
        self.size = size
    }
}


extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
