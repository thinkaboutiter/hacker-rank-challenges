import Foundation


let path = "DDUUDDUDUUUD"

enum Tracker {
    static private(set) var valleys: Int = 0
    static private(set) var mountains: Int = 0
    static private(set) var denivelation: Int = 0 {
        didSet {
            if denivelation == 0 {
                if oldValue < 0 {
                    valleys += 1
                }
                else if oldValue > 0 {
                    mountains += 1
                }
            }
        }
    }
    
    static func goUphill() {
        denivelation += 1
    }
    
    static func goDownhill() {
        denivelation -= 1
    }
    
    enum Direction {
        static let uphill = "U"
        static let downhill = "D"
    }
}


func countingValleys(steps: Int, path: String) -> Int {
    
    for element in path {
        let string = String(element)
        if string == Tracker.Direction.uphill {
            Tracker.goUphill()
        }
        else if string == Tracker.Direction.downhill {
            Tracker.goDownhill()
        }
    }
    
    assert(Tracker.denivelation == 0, "Route should end at sea level (0)")
    return Tracker.valleys
}

let result = countingValleys(steps: 8, path: path)
