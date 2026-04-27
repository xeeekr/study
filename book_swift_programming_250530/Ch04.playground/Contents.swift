import UIKit

typealias MyInt = Int
let age: MyInt = 100
var year: Int = 2020
year = age

//var person: (String, Int, Double) = ("name", 100, 111.1)
//print("name: \(person.0), age: \(person.1), height: \(person.2)")

typealias PersonTuple = (name: String, age: Int, height: Double)
var person: PersonTuple = ("name", 100, 111.1)
print("name: \(person.0), age: \(person.1), height: \(person.2)")
print("name: \(person.name), age: \(person.age), height: \(person.height)")

var numbers: [Int] = [0, 1, 2, 3]
numbers.append(contentsOf: [5, 6])
numbers.insert(4, at: 4)
numbers.insert(contentsOf: [-2, -1], at: 0)
print(numbers.firstIndex(of: 3))
print(numbers.first)
print(numbers.last)
numbers.removeFirst()
numbers.removeLast()
numbers.remove(at: 0)
print(numbers[1...3])

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
        case .number(let value):
            return value
        case .addition(let left, let right):
            return evaluate(left) + evaluate(right)
        case .multiplication(let left, let right):
            return evaluate(left) * evaluate(right)
    }
}
print(evaluate(final))

