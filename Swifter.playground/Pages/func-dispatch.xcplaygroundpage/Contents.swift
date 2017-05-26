
import Foundation

class MyClass {
    func method(number: Int) -> Int {
        return number + 1
    }
}

let object = MyClass()
let result = object.method(number: 1)
// result = 2


let f = MyClass.method//类.类中的实例方法，返回的是一个函数:(类实例) ->(方法参数)->(方法返回值)
let object1 = MyClass()
let result1 = f(object)(1)


class MyClass1 {
    func method(number: Int) -> Int {
        return number + 1
    }
    
    class func method(number: Int) -> Int {
        return number
    }
}

let f1 = MyClass1.method//类.类中的类方法，返回的就是该类方法
// class func method 的版本

let f2: (Int) -> Int = MyClass1.method
// 和 f1 相同

let f3: (MyClass1) -> (Int) -> Int = MyClass1.method
// func method 的柯里化版本
