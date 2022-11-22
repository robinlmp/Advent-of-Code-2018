import Foundation

struct Day2: Solution {
    static let day = 2
    
    let boxLabels: [BoxLabel]
    
    init(input: String) {
        boxLabels = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .map { string in
                BoxLabel(label: string)
            }
    }
    
    func calculatePartOne() -> Int {
        let twos = boxLabels
            .filter {
                $0.hasTwo
            }
            .count
        
        let threes = boxLabels
            .filter {
                $0.hasThree
            }
            .count
        
        return twos * threes
    }
    
    func calculatePartTwo() -> Int {
        processLabels()
        return 5
    }
}

extension Day2 {
    ////    func calculate
    
    func processLabels() {
        var results: [(String, String)?] = []
        for i in 0 ..< boxLabels.count-1 {
            for j in 0 ..< boxLabels.count-1 {
                    results.append(compareLabels(label1: boxLabels[i], label2: boxLabels[j]))
                
            }
        }
        results = results.compactMap { $0 }
//        print(results)
    }
}


func compareLabels(label1: BoxLabel, label2: BoxLabel) -> (String, String)? {
    
    var mismatchCount: Int = 0
    var returnString1: String = ""
    var returnString2: String = ""
    
    for i in 0 ..< label1.label.count {
        let label1Index = label1.label.index(label1.label.startIndex, offsetBy: i)
        let label2Index = label2.label.index(label2.label.startIndex, offsetBy: i)
        
        if label1.label[label1Index] != label2.label[label2Index] {
            mismatchCount += 1
            if mismatchCount > 1 {
                continue
            }
        }
        if mismatchCount == 1 && i == label1.label.count-1 {
            returnString1 = label1.label
            returnString2 = label2.label
            return (returnString1, returnString2)
        }
    }
    return nil
}


//    func processLabels_old() {
//        for i in 0 ..< boxLabels.count {
//            for j in 0 ..< boxLabels.count {
//                do {
//                    let result = try inspectCharacters_old(baseLabel: boxLabels[i], comparisonLabel: boxLabels[j])
//                } catch {
//                    print(error)
//                }
//            }
//        }
//    }

//    func inspectCharacters_old(baseLabel: BoxLabel, comparisonLabel: BoxLabel) throws -> (String?, String?, Int) {
//        guard baseLabel.labelCharacters == comparisonLabel.labelCharacters else { throw CountError.countError }
//
//        var mismatchCount: Int = 0
//        var returnString1: String?
//        var returnString2: String?
//
//        for i in 0 ..< baseLabel.label.count {
//            for j in 0 ..< comparisonLabel.label.count {
//                if baseLabel.label.index(baseLabel.label.startIndex, offsetBy: i) != comparisonLabel.label.index(comparisonLabel.label.startIndex, offsetBy: i) {
//                    mismatchCount += 1
//                    if mismatchCount > 1 {
//                        throw CountError.tooManyMismatchedCharacters
//                    } else if mismatchCount == 1 && j == comparisonLabel.label.count-1 {
//                        returnString1 = baseLabel.label
//                        returnString2 = comparisonLabel.label
//                    }
//                }
//            }
//        }
//
//        return (returnString1, returnString2, mismatchCount)
//    }

//    func closelyMatchingLabels(labels: [BoxLabel]) -> String {
//        var tempLabels = labels
//        for label in tempLabels {
//            let count = label.labelCharacters.count
//
//            for i in 0 ..< tempLabels.count {
//                if tempLabels[i].labelCharacters.count != count {
//                    continue
//                } else {
//                    for j in 0 ..< label.label.count {
//                    }
//                }
//            }
//        }
//
//        return ""
//    }
//}

struct BoxLabel {
    let label: String
    var labelCharacters: NSCountedSet
    var hasTwo: Bool = false
    var hasThree: Bool = false
    var mismatchCount: Int = 0
    
    
    init(label: String) {
        self.label = label
        self.labelCharacters = []
        
        label.forEach {
            labelCharacters.add( String($0) )
        }
        
        hasTwo = calculateHas(2, in: labelCharacters)
        hasThree = calculateHas(3, in: labelCharacters)
        
    }
    
    func calculateHas(_ num: Int, in alphabetCount: NSCountedSet) -> Bool {
        let values = alphabetCount.map { element in
            alphabetCount.count(for: element)
        }
        
        if values.contains(num) {
            return true
        } else {
            return false
        }
    }
}

enum CountError: Error {
    case countError
    case tooManyMismatchedCharacters
}


struct BoxLabel_firstSolution {
    let label: String
    var alphabetCount: [String : Int] = [
        "a": 0,
        "b": 0,
        "c": 0,
        "d": 0,
        "e": 0,
        "f": 0,
        "g": 0,
        "h": 0,
        "i": 0,
        "j": 0,
        "k": 0,
        "l": 0,
        "m": 0,
        "n": 0,
        "o": 0,
        "p": 0,
        "q": 0,
        "r": 0,
        "s": 0,
        "t": 0,
        "u": 0,
        "v": 0,
        "w": 0,
        "x": 0,
        "y": 0,
        "z": 0,
    ]
    
    var hasTwo: Bool = false
    var hasThree: Bool = false
    
    
    
    init(label: String) {
        self.label = label
        
        for letter in label.indices {
            let character = String(label[letter])
            
            if let currentValue = alphabetCount[character] {
                alphabetCount.updateValue(currentValue + 1, forKey: character)
            }
        }
        
        hasTwo = calculateHas(2, in: alphabetCount)
        hasThree = calculateHas(3, in: alphabetCount)
    }
    
    func calculateHas(_ num: Int, in alphabetCount: [String : Int]) -> Bool {
        let values = alphabetCount.map { (key: String, value: Int) in
            value
        }
        if values.contains(num) {
            return true
        } else {
            return false
        }
    }
}
