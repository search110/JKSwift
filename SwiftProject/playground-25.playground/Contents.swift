//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
  扩展
  扩展就是为一个已有的类、结构体、枚举类型或者协议类型添加新的功能、包括在没有权限获取原始源代码的情况下扩展类的功能(即逆向建模) swift类的扩展是没有名字的不像OC
 swift中扩展可以用:
 1 添加计算型属性和计算型类型属性
 2 定义实例方法和类型方法
 3 提供新的构造器
 4 定义下标
 5 定义和使用新的嵌套类型
 6 使一个已有的类型符合某种协议
 7 swift中、你甚至可以对协议进行扩展、提供协议要求实现或者添加的额外功能 从而可以让符合协议的类型拥有这些定义的功能
 
 //注意:协议可以为一个类型添加新的功能、但是不能重写已经存在的功能
 */

class SomeType{
    
}
/*
  1 扩展语法
  使用extension关键字来声明扩展
 */
//为SomeType添加扩展
extension SomeType{
     //为 SomeType 添加的新功能写到这里
}

/*
//使一个已有的类型添加一个或者多个协议(为SomeType添加协议)
extension SomeType:SomeProtocol,AnotherProctocol{
    //协议的代码写这里
}
 
 //给某个协议添加新的功能
 extension someProtocol{
 //协议新功能
 }
 
*/

//注意:如果你通过扩展为一个已经存在的类型扩展新的功能、那么新的功能对该类似所有的已有的实例都是可用的、及时它们是在这个扩展协议之前创建的



/*
  2 计算型属性
  扩展可以为已经存在的类型添加计算型属性和计算型类型属性
 */
extension Double{
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")


let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
//注意:扩展可以为已经存在的类型添加新的计算型属性、但是不能添加存储属性、也是不可以为已经存在的属性添加属性观察器

/*
  3 构造器
  1 扩展可以为已有的类型添加新的构造器、这可以让你扩展其他的类型、可以让你自己的类型作为其他类型的构造器参数
  2 或者提供该类型原始实现中未提供的额外初始化选项
  3 扩展可以为“类”添加新的“便利构造器” 但是不能为类添加新的指定构造器或者析构器、析构器和指定构造器必须由原始的类来提供
    (值类型中的原始中定义了自定义构造器那么“默认构造器”和“逐一成员构造器”就不能使用、可以将值类型的自定义构造器写在扩展中 这样在创建值类型的时候可以使用自定义构造器也可以使用默认构造器)
 
 注意:如果你使用扩展为一个“值类型”(枚举和结构体)添加构造器、同时该值类型的原始定义中未定义任何的定制的构造器且所有的存储属性都提供了默认值、那么我们可以在扩展中的构造器中调用“默认的构造器”和“逐一成员构造器”
 */

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

//默认构造器:如果结构体和类的所有属性都有默认值、并且原始类中没有自定构造器、那么swift会给这些类定义一个默认的构造器
//默认构造器
let defaultRect = Rect()
//逐一成员构造器
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),size: Size(width: 5.0, height: 5.0))

//添加Rect构造器扩展
extension Rect{
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        //逐一成员构造器
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),size: Size(width: 3.0, height: 3.0))
//注意:如果你使用扩展提供了一个新的构造器，你依旧有责任确保构造过程能够让实例完全初始化

/*
  4 方法
   扩展可以为一个已有的类型添加新的实例方法和类型方法
 */

extension Int {
    //参数类型是无参无返回值类型(闭包作为该函数的唯一参数)
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
//尾随闭包
3.repetitions {
    print("hello word!")
}
/*
 4.2 可变的实例方法(枚举和结构体是值的类型、值类型的属性不能在它的实例方法中修改的)
 通过扩展添加的实例方法也可以修改该实例本身、在结构体和枚举类型的“方法中”修改self本身或者修改属性时 需要将添加的实例方法标记为mutating、正如原生实现的可变方法一样
 */

struct IntType{
    //在值类型中: 1 类型属性是可以在类型方法中修改的 不能在实例方法中修改
    //2 实例属性 在实例方法和类型方法中都是不能修的 如果在实例方法的前面添加mutating 将实例方法修改为可变方法  则实例方法则可以修实例属性
    var name = "Tom"
   mutating func changeName(){
        self.name = "ni"
    }
    
    static var height = "10"
    static func changeName2(){
        self.height = "18"
    }
}

class OtherType{
    //在类类型中 实例属性和类型属性在方法中是可以修改的 但是实例属性只能使用在实例方法中 类型属性只能使用在类型方法中
    var name = "Tome"
    func changeName() {
        self.name = "jack"
    }
    
   static var height = "12"
   static func changeName2() {
       self.height = "18"
    }
}

extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()


/*
  5 下标:扩展可以为已有的"类型"添加新的下标
 */
//使用扩展为Int类型添加新的下标
extension Int {
    
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

let value = 123456[0]


/*
 6 嵌套类型:扩展可以为已有的类、结构体和枚举添加新的嵌套类型
 */

extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}


func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", terminator: "")
        case .Zero:
            print("0 ", terminator: "")
        case .Positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])




















