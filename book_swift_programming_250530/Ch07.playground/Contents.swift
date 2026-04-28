import UIKit

func sayHello(from myName:String, to name:String) -> String {
    "Hello \(name)! I'm \(myName)"
}
print(sayHello(from: "myName", to: "yourName"))

func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)! "
    }
    return result
}
sayHello("name", 2)
func sayHello(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)@ "
    }
    return result
}
sayHello(to: "name", repeatCount: 2)

func sayHelloToFriends(friends names: String..., me: String) -> String {
    var result: String = ""
    for friend in names {
        result += "Hello \(friend)! "
    }
    result += "I'm \(me)!"
    
    return result
}
sayHelloToFriends(friends: "a", "b", "c", me: "me")
sayHelloToFriends(me: "me")

var numbers: [Int] = [1, 2, 3]
func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}
func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}
nonReferenceParameter(numbers)
print(numbers[1])
referenceParameter(&numbers)
print(numbers[1])

var storedValue: Int = 0
@MainActor
func isLessThen(lhs: borrowing Int, rhs: borrowing Int) -> Bool {
    if lhs < storedValue {
        storedValue = copy lhs
    } else if rhs < storedValue {
        storedValue = copy rhs
    }
    return lhs < rhs
}

var global: Int = 0
var someLocal: Int = 10
@MainActor
func store(value: consuming Int) {
    global = value
}
store(value: someLocal)
@MainActor
func storeAndPrint(value: consuming Int) {
    global = value
    print(value)
}
@MainActor
func copyAndPrint(value: consuming Int) {
    global = copy value
    print(value)
}
store(value: someLocal)
print(someLocal)

typealias CalculateTwoInts = (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    a * b
}
var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2, 5))
mathFunction = multiplyTwoInts
print(mathFunction(2, 5))
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 2, 5)
func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts as CalculateTwoInts
}
printMathResult(chooseMathFunction(true), 3, 5)
printMathResult(chooseMathFunction(false), 3, 5)

typealias MoveFunc = (Int) -> Int
func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        currentPosition + 1
    }
    func goLeft(_ currentPosition: Int) -> Int {
        currentPosition - 1
    }
    return shouldGoLeft ? goLeft : goRight as MoveFunc
}
var position: Int = 3
let moveToZero: MoveFunc = functionForMove(position > 0)
print("원점으로 갑시다.")
while position != 0 {
    print("\(position)... ")
    position = moveToZero(position)
}
print("원점 도착!")
