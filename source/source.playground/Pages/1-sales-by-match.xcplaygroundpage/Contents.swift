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
