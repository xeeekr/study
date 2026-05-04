import UIKit

/*
public struct SomeType {
    private var privateVariable = 0
    fileprivate var fileprivateVariable = 0
}

extension SomeType {
    public func publicMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    
    private func privateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    
    fileprivate func fileprivateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
}

struct AnotherType {
    var someInstance: SomeType = SomeType()
    
    mutating func someMethod() {
        self.someInstance.publicMethod()
        self.someInstance.fileprivateVariable = 100
        self.someInstance.fileprivateMethod()
        
        //self.someInstance.privateVariable = 100
        //self.someInstance.privateMethod()
    }
}

var anotherInstance = AnotherType()
anotherInstance.someMethod()
*/

public struct SomeType {
    private var count: Int = 0
    public var publicStoredProperty: Int = 0
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    public subscript() -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
}

var someInstance: SomeType = SomeType()
print(someInstance.publicStoredProperty)
someInstance.publicStoredProperty = 100
print(someInstance.publicGetOnlyStoredProperty)
//someInstance.publicGetOnlyStoredProperty = 100
print(someInstance.internalComputedProperty)
someInstance. = 100
print(someInstance.internalGetOnlyComputedProperty)
//someInstance.internalGetOnlyComputedProperty = 100
print(someInstance[])
someInstance[] = 100
print(someInstance[0])
someInstance[0] = 100
