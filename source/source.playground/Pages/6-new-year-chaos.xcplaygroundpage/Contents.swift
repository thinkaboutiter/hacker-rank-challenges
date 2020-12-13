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

/**
 source: https://github.com/thinkaboutiter/hacker-rank-challenges/issues/11
 */

enum BribesUtils {
    
    enum SubQueueStatus {
        case noEvents
        case lessThanOrEqualToThreshold(count: Int)
        case moreThanThreshold
    }
    
    static func statusElementsValuesInQueue(after currentElement: Int, nextElements: [Int]) -> SubQueueStatus {
        var events = 0
        for element in nextElements {
            if element < currentElement {
                events += 1
                if events > BribesUtils.threshold {
                    break
                }
            }
        }
        
        let result: SubQueueStatus
        switch events {
        case 0:
            result = .noEvents
        case 1...BribesUtils.threshold:
            result = .lessThanOrEqualToThreshold(count: events)
        default:
            result = .moreThanThreshold
        }
        return result
    }
    
    static let elementsInSubQ: Int = threshold + 1
    static let threshold: Int = 2
}


func minimumBribes(q: [Int]) -> Void {

    var bribesCount = 0
    var passed = Set<Int>()
    
    for (index, element) in q.enumerated() {
        if element < q.count {
            var swapCount = 0
           
            for previous in stride(from: element - 1, through: 1, by: -1) {
                if !passed.contains(previous) {
                    swapCount += 1
                    bribesCount += 1
                    if swapCount > BribesUtils.threshold {
                        print("Too chaotic")
                        return
                    }
                }
            }
            passed.insert(element)
        }
        else {
            guard index + 1 != q.endIndex else {
                break
            }
            let diff = q.endIndex - 1 - index
            let range = (index + 1)...(index + diff)
            let subQ = q[range]
            let status = BribesUtils.statusElementsValuesInQueue(after: element, nextElements: Array(subQ))
            switch status {
            case .noEvents:
                continue
            case .lessThanOrEqualToThreshold(let count):
                bribesCount += count
            default:
                print("Too chaotic")
                return
            }
        }
    }
    print("\(bribesCount)")
}

let input_1 = [2, 1, 5, 3, 4]
let input_2 = [2, 5, 1, 3, 4]
let input_3 = [5, 1, 2, 3, 7, 8, 6, 4]
let input_4 = [1, 2, 5, 3, 7, 8, 6, 4]
let input_5 = [1, 2, 7, 3, 4, 5, 6, 8]

minimumBribes(q: input_1)
minimumBribes(q: input_2)
minimumBribes(q: input_3)
minimumBribes(q: input_4)

