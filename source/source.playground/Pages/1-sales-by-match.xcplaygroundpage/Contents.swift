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

/// Holding two equal elements
struct Pair<T> where T: Equatable {
    let firstItem: T
    var secondItem: T?
    
    init(item: T) {
        firstItem = item
    }
    
    mutating func addSecondItem(_ second: T) {
        guard second == firstItem else {
            return
        }
        secondItem = second
    }
    
    func isValid() -> Bool {
        return firstItem == secondItem
    }
}

// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var pairs: [Pair<Int>] = []
    
    for single in ar {
        if let index = pairs.firstIndex(where: { (pair: Pair<Int>) -> Bool in
            return pair.firstItem == single
                && !pair.isValid()
        }) {
            var pair = pairs[index]
            pair.addSecondItem(single)
            pairs[index] = pair
        }
        else {
            let pair = Pair(item: single)
            pairs.append(pair)
        }
    }
    
    let pairsCount = pairs.reduce(0) { (result, pair) -> Int in
        if pair.isValid() {
            return result + 1
        }
        else {
            return result
        }
    }

    return pairsCount
}

let result = sockMerchant(n: 9, ar: [10, 20, 20, 10, 10, 30, 50, 10, 20])
