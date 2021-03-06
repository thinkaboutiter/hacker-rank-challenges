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
 source: https://github.com/thinkaboutiter/hacker-rank-challenges/issues/5
 */

enum Jumper {
    private(set) static var jumps: Int = 0
    static func jump() {
        jumps += 1
    }
}

// Complete the jumpingOnClouds function below.
func jumpingOnClouds(c: [Int]) -> Int {
    var index = 0
    while index < c.count {
        let element = c[index]
        guard element == 0 else {
            break
        }
        
        // try long jump
        let longJumpIndex = index + 2
        if longJumpIndex < c.count
            && c[longJumpIndex] == 0
        {
            index = longJumpIndex
            Jumper.jump()
            continue
        }
        
        // try short jump
        let shorJumpIndex = index + 1
        if shorJumpIndex < c.count
            && c[shorJumpIndex] == 0
        {
            index = shorJumpIndex
            Jumper.jump()
            continue
        }
        break
    }
    return Jumper.jumps
}

let c = [0, 0, 1, 0, 0, 1, 0]
let expected = 4

let result = jumpingOnClouds(c: c)

print(expected == result
        ? "SUCCESS"
        : "FAILURE")
