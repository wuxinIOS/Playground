
import Foundation

func addOne(num: Int) -> Int {
    return num + 1
}

func addTo(_ adder: Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

let addTwo = addTo(2)    // addToFour: Int -> Int
print(addTwo)
let result = addTwo(6)   // result = 8



func lowThan(_ comparer:Int) -> (Int) ->Bool {
    return {
        value in
        return value < comparer
    }
}

let lowThan100 = lowThan(100)
let low = lowThan100(11)
print(low)

func greaterThan(_ comparer: Int) -> (Int) -> Bool {
    return { $0 > comparer }
}

let greaterThan10 = greaterThan(10);

greaterThan10(13)    // => true
greaterThan10(9)     // => false

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>: TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
    // ...
}


class Control {
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(target: T,
        action: @escaping (T) -> () -> (), controlEvent: ControlEvent) {
            
            actions[controlEvent] = TargetActionWrapper(
                target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}


class MyViewController {
    let button = Control()
    
    func viewDidLoad() {
        button.setTarget(target: self, action: MyViewController.onButtonTap, controlEvent: .TouchUpInside)
    }
    
    func onButtonTap() {
        print("Button was tapped")
    }
}
