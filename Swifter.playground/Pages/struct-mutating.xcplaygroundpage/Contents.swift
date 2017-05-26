
import Foundation

/* Wrong code
struct User {
    var age : Int
    var weight : Int
    var height : Int
    
    func gainWeight(newWeight: Int) {
        weight += newWeight
    }
}
*/
//   mutating 关键字作用:修饰在结构体或枚举中的方法,在方法中可以修改属性值
struct User {
    var age : Int
    var weight : Int
    var height : Int
    
    mutating func gainWeight(newWeight: Int) {
        weight += newWeight
    }
}

var u = User(age: 1, weight: 1, height: 1)
u.gainWeight(newWeight: 2)
u

