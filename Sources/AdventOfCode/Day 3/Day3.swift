struct Day3: Solution {
    static let day = 3
    
    init(input: String) {
        
    }
    
    func calculatePartOne() -> Int {
        0
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}

struct FabricRectangle {
    let id: Int
    let xInset: Int
    let yInset: Int
    let width: Int
    let height: Int
    
    var area: [(Int, Int)] {
        for i in 0 ..< width {
            for j in 0 ..< height {
                self.area.append(((i+width), (j+height)))
            }
        }
        
        return [(0,0)]
    }
}
