import Foundation


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

let level = [0, 0, 1, 0, 0, 1, 0]

let result = jumpingOnClouds(c: level)
