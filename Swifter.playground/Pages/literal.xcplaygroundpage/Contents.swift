

import Foundation

let aNumber = 3
let aString = "Hello"
let aBool = true

let anArray = [1,2,3]
let aDictionary = ["key1": "value1", "key2": "value2"]

typealias ALC = ExpressibleByArrayLiteral
typealias BLC = ExpressibleByBooleanLiteral
typealias DLC = ExpressibleByDictionaryLiteral
typealias FLC = ExpressibleByFloatLiteral
typealias NLC = ExpressibleByNilLiteral
typealias ILC = ExpressibleByIntegerLiteral
typealias SLC = ExpressibleByStringLiteral

enum MyBool: Int {
    case myTrue, myFalse
}

extension MyBool: ExpressibleByBooleanLiteral {
    init(booleanLiteral value: Bool) {
        self = value ? .myTrue : .myFalse
    }
}

let myTrue: MyBool = true
let myFalse: MyBool = false

myTrue.rawValue    // 0
myFalse.rawValue   // 1

//class Person {
//    let name: String
//    init(name value: String) {
//        self.name = value
//    }
//}

class Person: ExpressibleByStringLiteral {
    let name: String
    init(name value: String) {
        self.name = value
    }
    
    required convenience init(stringLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(unicodeScalarLiteral value: String) {
        self.init(name: value)
    }
}

let p: Person = "xiaoMing"
print(p.name)

struct Person1: ExpressibleByArrayLiteral {
    var name: String = ""
    var job: String = ""
    typealias Element = String
    init(arrayLiteral elements: Person1.Element...) {
        if elements.count == 2 {
            name = elements[0]
            job = elements[1]
        }
    }
}

struct student: ExpressibleByArrayLiteral {
    var math: Float
    typealias Element = Float
    init(math:Float) {
        self.math = math
    }
    
    init(arrayLiteral elements: student.Element...) {
    self.init(math:elements[0])
    }
}

let xiaoming:student = [130]
print(xiaoming.math)


