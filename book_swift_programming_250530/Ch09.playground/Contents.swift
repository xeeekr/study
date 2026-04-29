import UIKit

class Person {
    
}

var yagom: Person = Person()
let friend: Person = yagom
let anotherFriend: Person = Person()

print(yagom === friend)
print(yagom === anotherFriend)
print(friend !== anotherFriend)
