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

    static let threshold: Int = 2
}


func minimumBribes(q: [Int]) -> Void {
    var bribesCount = 0
    var map = [Int: Int]()
    
    for (index, element) in q.enumerated() {
        var elementBribes = 0
        for number in stride(from: element - 1, through: 1, by: -1) {
            if map[number] == nil {
                elementBribes += 1
                if elementBribes > BribesUtils.threshold  {
                    print("Too chaotic")
                    return
                }
                bribesCount += 1
            }
        }
        map[element] = index
    }
    print("\(bribesCount)")
}

let input_1 = [2, 1, 5, 3, 4] // 3
let input_2 = [2, 5, 1, 3, 4] // too chaotic
let input_3  = [5, 1, 2, 3, 7, 8, 6, 4] // too chaotic
let input_4  = [1, 2, 5, 3, 7, 8, 6, 4] // 7

/**
 input 4 sample
 
 [1, 2, 3, 4, 5, 6, 7, 8]
 [1, 2, 3, 5, 4, 6, 7, 8]
 [1, 2, 5, 3, 4, 6, 7, 8]
 [1, 2, 5, 3, 6, 4, 7, 8]
 [1, 2, 5, 3, 6, 7, 4, 8]
 [1, 2, 5, 3, 7, 6, 4, 8]
 [1, 2, 5, 3, 7, 6, 8, 4]
 [1, 2, 5, 3, 7, 8, 6, 4]
 */

minimumBribes(q: input_1)
minimumBribes(q: input_2)
minimumBribes(q: input_3)
minimumBribes(q: input_4)

