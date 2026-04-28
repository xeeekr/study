import UIKit

firstLoop: for i in 1...10 {
    for j in 1...10 {
        if j.isMultiple(of: 2) && i.isMultiple(of: 2) {
            print(i * j)
            break firstLoop
        }
    }
}
