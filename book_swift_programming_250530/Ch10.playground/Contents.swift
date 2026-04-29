import UIKit

struct CoordinatePoint {
    var x: Int
    var y: Int
    
    var oppositePoint: CoordinatePoint {
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        set {
            x = -newValue.x
            y = -newValue.y
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

print(yagomPosition)

print(yagomPosition.oppositePoint)

yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)

print(yagomPosition)

class Account {
    static let dollarExchangeRate: Double = 1000.0
    
    var credit: Int = 0 {
        willSet {
            print("Credit will change : \(credit) -> \(newValue)")
        }
        didSet {
            print("Credit did change : \(oldValue) -> \(credit)")
        }
    }
    
    var dollarValue: Double {
        get {
            Double(credit) / Account.dollarExchangeRate
        }
        set {
            credit = Int(newValue * Account.dollarExchangeRate)
            print("Credit is changing \(newValue) dallars")
        }
    }
}

class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print("Credit will change : \(dollarValue)$ -> \(newValue)$")
        }
        didSet {
            print("Credit did change : \(oldValue)$ -> \(dollarValue)$")
        }
    }
}

let myAccount2 = ForeignAccount()
myAccount2.credit = 1000
myAccount2.dollarValue = 2

@MainActor
class AClass {
    static var typeProperty: Int = 0
    
    var instanceProperty: Int = 0 {
        didSet {
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    static var typeComputedProperty: Int {
        get {
            typeProperty
        }
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123
let classInstance = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

print(type(of: \Person.name))
print(type(of: \Stuff.name))

let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)

let yagom = Person(name: "yagom")
let hana = Person(name: "hana")
let macbook = Stuff(name: "MacBook Pro", owner: yagom)
var iMac = Stuff(name: "iMac", owner: yagom)
let iPhone = Stuff(name: "iPhone", owner: hana)

let stuffNameKeyPath = \Stuff.name
let ownerkeyPath = \Stuff.owner

let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)

print(macbook[keyPath: stuffNameKeyPath])
print(iMac[keyPath: stuffNameKeyPath])
print(iPhone[keyPath: stuffNameKeyPath])

print(macbook[keyPath: ownerNameKeyPath])
print(iMac[keyPath: ownerNameKeyPath])
print(iPhone[keyPath: ownerNameKeyPath])

iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerkeyPath] = hana


