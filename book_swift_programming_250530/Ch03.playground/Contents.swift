import UIKit

print(Int.random(in: 1...45))

var str = String()
str.append("name")
str = str + "."
print(str.count)
print(str.isEmpty)

let hello = "Hello"
print(hello.hasPrefix("He"))
print(hello.hasSuffix("llo"))
print(hello.uppercased())

let test = """
 good
  test
"""

