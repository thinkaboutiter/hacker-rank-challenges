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
 source: https://github.com/thinkaboutiter/hacker-rank-challenges/issues/7
 */

struct TokenCounter {
    let token: Character
    private(set) var count: Int = 0
    
    init(token: Character) {
        self.token = token
    }
    
    mutating func count(_ character: Character) {
        if character == token {
            count += 1
        }
    }
}

// Complete the repeatedString function below.
func repeatedString(s: String, n: Int) -> Int {
    let token: Character = "a"
    
    // evaluate if input contains only tokens
    var isContainingTokensOnly: Bool = true
    for element in s {
        if element != token {
            isContainingTokensOnly = false
            break
        }
    }
    
    if isContainingTokensOnly {
        return n
    }
    
    guard !s.isEmpty else {
        fatalError("Input is empty")
    }
    
    // how many whole repetitions of `s` there are for given `n` lenghted string
    let repetitions = Int(n / s.count)
    
    // calculate length of sub string to fill the `n` lenghted string
    let length = n % s.count
    let subString = String(s.prefix(length))
    
    var wholeStringCounter = TokenCounter(token: token)
    for char in s {
        wholeStringCounter.count(char)
    }
    
    var subStringCounter = TokenCounter(token: token)
    for char in subString {
        subStringCounter.count(char)
    }
    
    let result: Int = repetitions * wholeStringCounter.count + subStringCounter.count
    return result
}

let s = "aba"
let n = 10
let expected = 7

let result = repeatedString(s: "aba", n: 10)

print(expected == result
        ? "SUCCESS"
        : "FAILURE")
