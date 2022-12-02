import Foundation

func parseDay2Input(from file: String) -> [(String, String)] {
    let result = file.components(separatedBy: "\n")
    
    let pairs = result.map {
        let pair = $0.split(separator: " ")
        return (String(pair.first ?? ""), String(pair.last ?? ""))
    }
    
    return pairs
}

