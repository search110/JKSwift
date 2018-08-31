//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 属性
 */
//属性将值跟特定的类、结构体、枚举关联起来
//1 存储属性:是用于存储常量或者变量使得常量或者变量作为实例的一部分(只能在类、结构体中使用)
//2 计算属性:计算一个属性的值(计算属性用于 类、结构体、枚举)
//3 类型属性:属性也可以直接作用于类型本身 就是如下 var Property = class()
//总结:存储属性和计算属性通常与特定类型的实例关联

//属性观察器:观察属性值的变化 以此来触发一个自定义的操作 属性观察器可以添加到自定义的存储属性上还可以添加到从父类继承的属性上
//1 存储属性:存储属性就是存储在特定类或结构体实例里的一个常量或变量 存储属性可以是变量存储属性（用关键字 var 定义），也可以是常量存储属性（用关键字 let 定义 当存储属性为常量时候再次想修改的时候是不能再变的) 存储属性可以在定义存储属性的时候f赋予默认值 也可以在构造过程中赋予初始化的值或者修改值 甚至修改常量存储的值(用于类中)

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
//length 为常量不能修改  firstValue为变量可以修改

//1.1常量结构体存储的属性:let constant = FixedLengthRange 如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该结构体实例的任何成员，即使有成员属性被声明为变量也不行 因为结构体是值类型 引用是对常量的引用  而不是对结构体的引用了 类的属性则可以修改 但是不管是类还是结构体内部的常量属于就不能改变
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 该区间表示整数0，1，2，3
//rangeOfFourItems.firstValue = 6 因为结构体是值的类型 当赋值给常量时候 常量会拷贝一份新的结构体的属性 而指向一个新的实例对象 当你想访问修改一个常量的属性时候是不能的(也可以理解为结构体值类型声明为常量时候 该常量对应的属性也全部为常量)
//类是引用类型: 而类则不一样 把一个类赋值给一个常量后 修改的是常量引用对象属性 而不是引用对象实例的常量

//1.2 延迟存储属性:延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性 在属性声明前使用lazy来标示一个延迟存储属性。
//注意:因为有的属性的初始值可能在实例构造完成之后拿到 所以必须将延迟声明属性将属性声明成变量、而常量定义的属性初始值在构造完成的过程中必须要有初始值

class DataImporter {
    /* DataImporter 是一个负责将外部文件中的数据导入的类。 这个类的初始化会消耗不少时间。 */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    
    lazy var importer = DataImporter()
    var data = [String]()
    
    // 这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

//在下面方法之前 DataImporter的实例 importer仍然没有被创建
//只有当定义为延迟属性的变量被第一次使用时候才会被创建
print(manager.importer.fileName)

//1.3 存储属性和实例变量的关系:swift中属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义

//2 计算属性:除存储属性外 类、枚举和结构体可以定义计算属性 计算属性不直接的存储值 而是提供一个getter和一个可选的setter 来间接的获取和设置其他的属性或变量值 “所以的计算属性都必须带类型"

//计算属性定义的变量或者常量只能使用关键字Var来定义 因为它们的值是不固定的  let表示常量 初始化后就不能改变
struct Point{
    
    var x = 0.0, y = 0.0
}

struct Size{
    
    var width = 0.0, height = 0.0
}

struct Rect {
    
    var origin = Point()
    var size = Size()
   //结构体中的存储属性 存储属性会提供一个getter方法来获取其他属性的值 或者使用setter来设置其他属性的值 定义的变量类型只能使用var
    var center: Point
    {
        get
        {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) //set如果没有定义新的参数名 则 newCenter 可以使用newValue
        {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

//结构体成员逐一构造器初始化方法(只有结构体才有)
var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//2.1 只读计算属性:只有 getter 没有 setter 的计算属性就是只读计算属性 只读计算属性总是返回一个值，但不能设置新的值 可以通过点运算符访问该属性 只读计算属性的声明可以去掉 get关键字和花括号

struct Cuboid{
    
    var width = 0.0, height = 0.0, depth = 0.0
    //只读计算属性
    var volume: Double{
     
        return width * height * depth
    }
}

print(Cuboid().volume)

//3 属性观察器:属性观察器监控和响应属性值变化 每次属性值发生变化的时候都会调用属性观察器 即使新值和当前的值一致的时候
//添加属性观察器的属性类型:1 除延迟存储属性外的其他存储属性可以添加属性观察器 2 可以重写继承父类的属性添加属性观察器(可以是存储属性和计算属性) 3 不需要为非继承的计算属性添加属性观察器 因为可以通过setter方法直接监控和响应值的变化
//为属性添加一个或者多个全部的属性观察器: 1 willSet 在新的值被设立之前调用 2 didSet 在新的值被设置完成后调用
//willSet 观察器会将新的值作为常量参数传入 willSet中可以为参数指定名称 如果不用则为newValue
//didSet 观察器会将旧的值作为属性观察器作为常量的参数传入 didSet可以为参数命名或者使用旧的oldValue 如果在didSet中再次对属性赋值 那么新值会覆盖旧值
//注意:如果父类的属性在子类的构造器中被赋值 先调用子类的willSet和didSet方法 再调用子类的willSet 和 didSet方法 在父类初始化方法调用之前，子类给父类属性赋值时，观察器不会被调用. in-out参数也会调用willSet和didSet方法
class StepCounter{
    
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps){ //如果不名命参数名则使用newValue
            
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet{//如果不名命参数名则使用oldValue
            
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}


let stepCounter = StepCounter()
stepCounter.totalSteps = 200


//4 全局变量和局部变量:计算属性和属性观察器功能也可以用于全局变量和局部变量 全局变量是定义在函数、方法、闭包、或者任意类型之外定义的变量 局部变量是定义在函数、方法、闭包内部定义的变量

//注意:定义在类、结构体、枚举内部的叫属性 其他的叫变量(全局变量或者局部变量)

//1 全局或者局部变量属于存储型变量和存储属性类似.它为特定类型的值提供空间 并允许读取和写入.
//2 在全局或者局部范围内可以定义存储型变量(一般定义的全局或者局部变量都是存储型变量) 也可以定义计算型变量(实现setter getter方法)或者只读计算型变量(实现getter方法)

//全局和局部变量和属性的区别:
//相同点:“全局”的常量或变量都是延迟计算的，跟延迟存储属性相似 延迟计算就是调用的时候才初始化
//不同点:1 ”全局“常量或者变量不需要在常量或变量前面添加lazy关键字  2 局部的变量或者常量不是延迟计算的

var d: String = "234" //全局变量 这个变量是延迟计算的 调用时候才初始化

func someFunction() -> Int{
    //d 为存储类变量
    var d: String = "124"  //局部变量 不是延迟计算  在someFunction()方法调用时候就初始化了
    //定义方法内部的局部变量fcun为只读计算变量
    var fcun: Int{
        
        return 2
    }
    
    return fcun
}


func someFunction2() -> (){
    //定义局部的计算型变量 fcun
    var fcun: Int{
        
        get{
           
            return 2
        }
        set{
            print(newValue)
        }
    }
}

func someFunction3() -> (){
    //定义了局部变量fcun的属性观察器(观察器必须有一个初始化值)
    var fcun: Int = 0{
        
        willSet{
            print(newValue)
        }
        didSet{
           print(oldValue)
        }
    }
}

//5 类型属性:实例属性属于一个特定类型的属性 每个实例都拥有独立的一份属性值 实例之间的属性都是独立的 swift可以为类型本身定义属性 无论创建多少个该类型的实例 这些类型都是唯一的一份 这种属性就是类型属性
//类型属性的作用:类型属性用于定义某个类型所有实例共享的数据 所有类型都可以使用的常量或者变量
//类型属性分类:1 存储型类型属性可以是常量或者是变量 2 计算型类型属性和实例属于(类、结构体、枚举)一样只能是变量
//注意:1 存储型类型属性必须存在默认值 因为类型属性不存在构造器 也就无法初始化过程赋值 2 存储型类似属性是延迟初始化的 它们在第一次访问的时候才初始化 即使被多个线程同时访问 系统也保证只对其进行一次初始化 并不需要添加lazy关键词
 class MyClass{
 }
class Myclass1{
    //myclass是实例属性(实例属性属于一种特定的类型属性)
    var myclass = MyClass()
}

//5.1 类型属性的语法:swift中的类型属性作为类型定义的一部分写在类型最外层的花括号内 作用范围为该类型的支持范围 使用关键字static类定义存储型类型属性和计算型类型属性 使用class定义的计算型类型属性可以被子类实现重写
struct SomeStructure{
    //定义为变量的存储型类型属性(必须存储默认值)
    static var storedtypeProperty: String = "some property"
    //定义为常量的存储型类型属性
    static let storedtypeProperty1: String = "some"
    //定义为变量的只读计算型类型属性
    static var computedTypeProperty: Int{
        
        return 1
    }
}
//枚举也存在类型属性
enum SomeEnumeration
{
    static var storedTypeProperty = "Some value."
    
    static var computedTypeProperty: Int {
        return 6
    }
}


class SomeClass {
    
    static var storedTypeProperty = "Some value."
    
    static var computedTypeProperty: Int {
        
        return 27
    }
    //class修饰的只读计算型类型属性 可以被子类重写
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

//5.2 获取和设置类型属性的值:类型属性也是通过点语法类来运行访问 类型属性是通过类型本身访问的 不是通过实例

print(SomeClass.storedTypeProperty)

//通过本身类型来访问 不需要通过创建的失实例
SomeClass.storedTypeProperty = "some some some"
print(SomeClass.storedTypeProperty)


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            // 类型属性必须为类型自己调用(重点)
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阈值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前音量作为新的最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}











