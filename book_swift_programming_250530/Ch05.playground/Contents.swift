import UIKit

var greeting = "Hello, playground"
 
var unsignedInterger: UInt8 = 0
//let errorUnderflowRsult : UInt8 = unsignedInterger - 1
let underflowedValue: UInt8 = unsignedInterger &- 1
unsignedInterger = UInt8.max
//let errorOverflowedValue: UInt8 = unsignedInterger + 1
let overflowedValue: UInt8 = unsignedInterger &+ 1

var someOptionalInt: Int? = nil
let valueInt: Int = someOptionalInt != nil ? someOptionalInt! : 0
let valueInt2: Int = someOptionalInt ?? 0

prefix operator **
prefix func ** (value: Int) -> Int {
    return value * value
}
let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive


prefix func ! (value: String) -> Bool {
    return value.isEmpty
}
var stringValue: String = "test"
var isEmptyString: Bool = !stringValue
stringValue = ""
isEmptyString = !stringValue
prefix func ** (value: String) -> String {
    return value + " " + value
}
stringValue = "test"
**stringValue

postfix operator **
postfix func ** (value: Int) -> Int {
    return value + 10
}
let five: Int = 5
let fivePlusTen: Int = five**
**five**

infix operator ** : MultiplicationPrecedence
func ** (lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}
let helloYagom: String  = "Hello yagom"
let yagom: String = "yagom"
let isContainsYagom: Bool = helloYagom ** yagom

class Car {
    var modelYear: Int?
    var modelName: String?
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.modelName == rhs.modelName
    }
}
struct SmartPhone {
    var company: String?
    var model: String?
    
    static func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
        return lhs.model == rhs.model
    }
}


