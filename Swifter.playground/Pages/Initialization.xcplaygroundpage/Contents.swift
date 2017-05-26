//: [Previous](@previous)
//构造器
/* 两种：1.指定构造器 Designated Initializer
        2.便利构造器 Convenience Initializer
 注意:  1.当自定义的类中没有定义任何 指定构造器，则会默认继承父类的全部 指定构造器
 
 
 
 */

import Foundation
import UIKit

class WXView : UIView {
    
    
    var text : String
    
    
    /* 提供了两种 指定构造器 */
    
    init(frame:CGRect,backgroundColor:UIColor) {
        text = "测试" //属性必须在调用父类的指定构造器之前进行初始化
        super.init(frame: frame) //自定义的指定构造器中必须调用父类的指定构造器
        
    }
    
    
    /* 这是必须实现的 */
    
    required init?(coder aDecoder: NSCoder) {
        text = "测试"
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        self.text = "测试"
        super.init(frame: frame)
    }
    
    /* 提供的便利构造器(数量不限)
     
     指定构造器必须调用它直接父类的指定构造器方法.
     便利构造器必须调用同一个类中定义的其它初始化方法.
     便利构造器在最后必须调用一个指定构造器.
     
     */
    
    convenience init(frame:CGRect,backgroundColor:UIColor,text:String) {
        
        self.init(frame:frame,backgroundColor:backgroundColor) //在对属性赋值之前,必须调用本类的指定构造器
        self.text = text
    }
    
    //便利构造器
    convenience init() {
        self.init(frame:CGRect(x: 0, y: 0, width: 0, height: 0))//调用本类的 指定构造器
        
    }
    
    
}
