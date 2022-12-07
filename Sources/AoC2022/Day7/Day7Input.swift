import Foundation
import RegexBuilder

func parseDay7Input(from file: String) -> FSNode {
    let result = file.components(separatedBy: "\n")
    
    var currentNode: FSNode!
    
    for line in result {
        if line.hasPrefix("$") {
            guard let command = parseCommand(line: line) else { break }
            
            switch command {
                case .cd(let dir):
                    if dir == ".." {
                        currentNode = currentNode?.parent
                    } else if let node = currentNode {
                        currentNode = node.children.first { $0.name == dir }!
                    } else {
                        currentNode = Dir(name: dir, parent: nil, children: [])
                    }
                    
                default:
                    break
                    
            }
        } else {
            guard let response = parseResponse(line: line) else { break }
            switch response {
                case .dir(let name):
                    let dir = Dir(name: name, parent: currentNode!, children: [])
                    currentNode?.children.append(dir)
                case .file(let size, let name):
                    let file = File(name: name, size: size, parent: currentNode!)
                    currentNode?.children.append(file)
            }
        }
    }
    
    while currentNode?.parent != nil {
        currentNode = currentNode?.parent
    }
    
    return currentNode
}

func parseCommand(line: String) -> Command? {
    let separator = " "
    let regex = Regex {
        "$"
        separator
        Capture {
            ChoiceOf {
                "ls"
                "cd"
            }
        }
        Optionally {
            separator
            Capture {
                OneOrMore(.any)
            }
        }
    }
    let commands: [Command] = line.matches(of: regex).compactMap {
        switch $0.output.1 {
            case "ls": return .ls
            case "cd": return .cd(dir: String($0.output.2!))
            default: return nil
        }
    }
    return commands.first
}

func parseResponse(line: String) -> Response? {
    let regex = Regex {
        Capture {
            ChoiceOf {
                "dir"
                OneOrMore(.digit)
            }
        }
        " "
        Capture {
            OneOrMore(.any)
        }
    }
    let responses: [Response] = line.matches(of: regex).compactMap {
        switch $0.output.1 {
            case "dir": return .dir(name: String($0.output.2))
            default: return .file(size: Int($0.output.1)!, name: String($0.output.2))
        }
    }
    return responses.first
}


enum Command {
    case ls
    case cd(dir: String)
}
extension Command: Equatable {}

enum Response {
    case dir(name: String)
    case file(size: Int, name: String)
}
extension Response: Equatable {}

protocol FSNode {
    var name: String { get }
    var size: Int { get }
    var parent: FSNode? { get }
    var children: [FSNode] { get set }
}

final class File: FSNode {
    let name: String
    let size: Int
    let parent: FSNode?
    var children: [FSNode] = []
    
    init(name: String, size: Int, parent: FSNode?) {
        self.name = name
        self.size = size
        self.parent = parent
    }
}

extension File: CustomDebugStringConvertible {
    var debugDescription: String { "(F) \(name), \(size)"}
}

final class Dir: FSNode {
    let name: String
    let parent: FSNode?
    var size: Int { children.map(\.size).reduce(0, +) }
    var children: [FSNode]
    
    init(name: String, parent: FSNode?, children: [FSNode]) {
        self.name = name
        self.parent = parent
        self.children = children
    }
}
extension Dir: CustomDebugStringConvertible {
    var debugDescription: String {
        var string = "(D) \(name), \(size)\n"
        for child in children {
            string.append("- \(child)\n")
        }
        return string
    }
}

