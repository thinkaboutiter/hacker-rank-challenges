import Foundation

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

let result = repeatedString(s: "aba", n: 10)
