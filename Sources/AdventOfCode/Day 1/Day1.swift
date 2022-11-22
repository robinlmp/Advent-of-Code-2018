struct Day1: Solution {
    static let day = 1
    
    var frequencyChanges: [Int]
    
    /// Initialise your solution
    ///
    /// - parameters:
    ///   - input: Contents of the `Day1.input` file within the same folder as this source file
    init(input: String) {
        frequencyChanges = input
            .components(separatedBy: .newlines)
            .compactMap(Int.init)
    }

    /// Return your answer to the main activity of the advent calendar
    ///
    /// If you need to, you can change the return type of this method to any type that conforms to `CustomStringConvertible`, i.e. `String`, `Float`, etc.
    func calculatePartOne() -> Int {
        return calculateTotal(frequencyChanges)
    }

    /// Return your solution to the extension activity
    /// _ N.B. This is only unlocked when you have completed part one! _
    func calculatePartTwo() -> Int {
        returnFirstDuplicateFrequency(frequencyChanges)
    }
}


extension Day1 {
    func calculateTotal(_ frequencyChanges: [Int]) -> Int {
        frequencyChanges
            .reduce(0, +)
    }
    
    func returnFirstDuplicateFrequency(_ frequencyChanges: [Int]) -> Int {
        var tempNums: Set<Int> = []
        var total: Int = 0
        var resultFound = false
        
        while resultFound == false {
            for i in 0 ..< frequencyChanges.count {
                total += frequencyChanges[i]
                
                if i == 0 {
                    tempNums.insert(total)
                    continue
                } else if tempNums.contains(total) {
                    resultFound = true
                    break
                } else {
                    tempNums.insert(total)
                }
            }
            
        }
        return total
    }
}
