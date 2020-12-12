//
// MIT License
//
// Copyright (c) 2020 Boyan Yankov (thinkaboutiter@gmail.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation


let path = "DDUUDDUDUUUD"

enum Tracker {
    private(set) static var valleys: Int = 0
    private(set) static var mountains: Int = 0
    private(set) static var denivelation: Int = 0 {
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
