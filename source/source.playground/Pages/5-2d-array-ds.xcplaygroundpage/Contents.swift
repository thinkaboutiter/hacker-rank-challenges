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

// issue

struct Coordinate2D {
    let row: Int
    let column: Int
}
func +(lhs: Coordinate2D, rhs: Coordinate2D) -> Coordinate2D {
    let result = Coordinate2D(row: lhs.row + rhs.row, column: lhs.column + rhs.column)
    return result
}

public extension Array {
    subscript(safeAt index: Int) -> Element? {
        var result: Element? = nil
        let range = 0..<count
        guard range ~= index else {
            return result
        }
        result = self[index]
        return result
    }
}

extension Array where Element == Array<Int> {
    subscript(safeAt coordinate: Coordinate2D) -> Int? {
        get {
            guard let rowCollection = self[safeAt: coordinate.row] else {
                return nil
            }
            guard let element = rowCollection[safeAt: coordinate.column] else {
                return nil
            }
            return element
        }
    }
}

let pattern: [[Int]] = [
    [1, 1, 1],
    [0, 1, 0],
    [1, 1, 1]
]

struct SumUtils {
    let pattern: [[Int]]
    let normalizedCoordinates: [Coordinate2D]
    
    init(pattern: [[Int]]) {
        self.pattern = pattern
        normalizedCoordinates = SumUtils.calculateNormalizedCoordinates(from: pattern)
    }
    
    private static func calculateNormalizedCoordinates(from pattern: [[Int]]) -> [Coordinate2D] {
        var result = Array<Coordinate2D>()
        for (row, collection) in pattern.enumerated() {
            for (column, element) in collection.enumerated() {
                if element == 1 {
                    let coordinate = Coordinate2D(row: row, column: column)
                    result.append(coordinate)
                }
            }
        }
        return result
    }
    
    private func patternCoordinates(
        for coordinate: Coordinate2D) -> [Coordinate2D]
    {
        var result = Array<Coordinate2D>()
        for normCoord in normalizedCoordinates {
            let patternCoord = coordinate + normCoord
            result.append(patternCoord)
        }
        return result
    }
    
    func computeSum(
        for coordinate: Coordinate2D,
        in container: [[Int]]) -> Int?
    {
        var values = Array<Int>()
        let patternCoords = patternCoordinates(for: coordinate)
        for coord in patternCoords {
            guard let value = container[safeAt: coord] else {
                return nil
            }
            values.append(value)
        }
        let result = values.reduce(0, +)
        return result
    }
}

// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {
    let utils = SumUtils(pattern: pattern)
    var sums = Array<Int>()
    rowLoop: for (row, collection) in arr.enumerated() {
        columnLoop: for (column, _) in collection.enumerated() {
            guard !(column + pattern.first!.endIndex > collection.endIndex) else {
                continue rowLoop
            }
            let coordinate = Coordinate2D(row: row, column: column)
            guard let coordSum = utils.computeSum(for: coordinate, in: arr) else {
                continue rowLoop
            }
            sums.append(coordSum)
        }
    }
    let result = sums.max() ?? 0
    return result
}


let sampleInput_1 = [
    [3, 7, -3, 0, 1, 8],
    [1, -4, -7, -8, -6, 5],
    [-8, 1, 3, 3, 5, 7],
    [-2, 4, 3, 1, 2, 7],
    [2, 4, -5, 1, 8, 4],
    [5, -7, 6, 5, 2, 8]
]

let expectedMaxSum_1 = 33

let actualMaxSum_1 = hourglassSum(arr: sampleInput_1)
