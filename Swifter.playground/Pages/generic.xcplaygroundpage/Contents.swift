
import Foundation


//定义一个把前一个数组中的元素添加到后一个数组中的方法（任何类型--泛型）
func copyArray<T>(scr:[T], dest : inout [T]) {
    
    for e in scr {
        dest.append(e)
    }
}

let oneArray = [1,2,3,4]
var towArray = [10,11,12]
copyArray(scr: oneArray, dest: &towArray)

print(towArray)

let strArray = ["one","tow"]
var str2Array = ["hehe","haha"]
copyArray(scr: strArray, dest: &str2Array)


//定义泛型函数
func projection<srcType,descType>(src:[srcType],fuc:(srcType)->descType) ->[descType] {
    
    var result = [descType]()
    for element in src {
       
        result.append(fuc(element))
    }
    
    return result
}

var books = ["任海瑞","iOS","engineer"]

let  countElements:(String) ->Int = { src -> Int in
    return src.characters.count
}

var proj1 = projection(src: books) {
    
    countElements($0)
}

print(proj1)

var proj2 = projection(src: books) {
    "<" + $0 + ">"
}

print(proj2)

let programmingLanguage = ["PHP","iOS","Java"]
var proj3 = projection(src: programmingLanguage) { (b:String) -> (String,String) in
    return (b,"吴昕")
    
    }
print(proj3)


//定义带泛型结构体类型
struct Rect<T> {
    var x:T
    var y:T
    var width:T
    var heigth:T
    
    var postion:(T,T) {
        return (self.x,self.y)
    }
    var size:(T,T) {
        
        return (self.width,self.heigth)
    }
    
}

let rect = Rect<Double>(x:1.2,y:3.4,width:8.5,heigth:7.8)

let (x,y) = rect.postion
print("\(x),\(y)")

//定义带泛型 类 类型

class Apple<T1,T2> {
    var info:T1
    var price:T2
    init(info:T1,price:T2) {
        self.info = info
        self.price = price
    }
}

var a1 = Apple<String,Float>(info:"苹果",price:5500)

print(a1.info,a1.price)

