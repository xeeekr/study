import UIKit

struct Student {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var student: [Student] = {
        var arr: [Student] = [Student]()
        
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.student.count)

class FileManager {
    var fileName: String
    
    init(filename: String) {
        self.fileName = filename
    }
    
    func openFile() {
        print("Open File: \(self.fileName)")
    }
    
    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }
    
    func writeFile() {
        print("Write File: \(self.fileName)")
    }
    
    func closeFile() {
        print("Close File: \(self.fileName)")
    }
    
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(filename: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil
