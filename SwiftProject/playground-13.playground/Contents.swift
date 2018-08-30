//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 类和结构体
 */
//类和结构体是构造代码的一种通用且灵活的构造体 我们可以使用完全相同的语法规则来为类和结构体定义属性(常量、变量)和方法、达到扩展类和结构体的功能
//swift不需要你为自定义的类和结构体创建接口和实现文件 你需要做的是在一个单一的文件中定义一个类或者结构体 系统自动生成面向其他代码的外部接口
//一般一个类的实例被称为对象 而swift中类和结构体的关系比其他语言中的关系更加密切 本节的大部分功能可以用在类和结构体中 所以主要会使用实例

//1 类和结构体的对比
//两者共同的特点:1 定义属性用于存储值 2 定义方法用于提供功能 3 定义下标可以通过下标语法访问实例所包含的值 4 定义构造器用于生成初始化值 5 通过扩展增加默认实现的功能 6 实现协议以提供某种标准功能

//1.1 类比结构体多附加功能:1 允许一个类继承另外一个类的特征 2类型转换 允许运行时检查和解释一个类实例的类型 3 构造器允许一个类实例释放任何其所被分配的资源 4 引用计数允许一个类的多次引用
//结构体是通过被复制的形式在代码中传递 所以不需要引用计数值


//1.2 定义语法: 通过关键字class和struct来分别表示类和结构体
class MyClass{
    //定义类
}

struct MyStruct{
    //定义结构体
}
//定义类和结构体开头字母大写 而方法和属性以小写的方式命名
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//1.3 类和结构体实例:结构体和类都使用构造器语法来生成新的实例。构造器语法的最简单形式是在结构体或者类的类型名称后跟随一对空括号 通过这种方式所创建的类或者结构体实例，其属性均会被初始化为默认值
let someResolution = Resolution()
let someVideoMode = VideoMode()

//1.4 属性访问
let property1 = someResolution.width
let property2 = someResolution.height
print(property1,property2)
//给属性赋值
someVideoMode.resolution.height = 100;
someVideoMode.resolution.width = 1

print(someResolution.width,someResolution.width)

//与Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性

//1.5 结构体类型成员逐一构造器:所有的结构体都有一个自动生成成员逐一构造器 主要用初始化结构体实例中成员属性 属性的初始值可以通过属性的名称传递到成员之中 与结构体不同，类实例没有默认的成员逐一构造器

var vga = Resolution(width: 100, height: 101)

//2 结构体和枚举是值类型:值类型在被赋值给常量、变量或者被传递给函数时候 其值会被拷贝 在Swift中，所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型 并且在底层都是以结构体的形式所实现
//在Swift中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制

//cinema是hd的一个副本 两者是完全不同的两个实例 赋值时候其实是拷贝hd中所以存储的属性值
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
//两个不同的实例对象
print(cinema.width)
print(hd.width)


enum CompassPoint {
    
    case North, South, East, West
}

var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East

if rememberedDirection == .West {
    print("The remembered direction is still .West")
}

//3 类是引用类型:与值的类型不同、引用类型被赋值到一个常量、变量或者传递给一个函数 其值不会被拷贝 引用的是已经存在的实例对象本身 而不是拷贝

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(tenEighty.frameRate)

//类是引用类型，所以tenEight和alsoTenEight实际上引用的是相同的VideoMode实例
//tenEighty和alsoTenEighty被声明为常量依然可以改变tenEighty.frameRate和alsoTenEighty.frameRate值 因为这两个常量的值并未改变 它们并不存储VideoMode实例 而是仅仅对VideoMode实例的引用 所以改变的是引用的VideoMode的属性 而不是改变引用VideoMode的常量值


//3.1恒等运算符:因为类是引用类型 可能一个类存在着一个或者多个常量或者变量引用类实例(结构体和实例则不会存在这种情况 因为他们赋值和传递值是被拷贝的)
//如何判定两个常量或者变量引用了同一个类型实例 可以使用 等价于(===)和不等价于(!==)来判定
//等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
//“等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}

//3.2 指针:一个引用某个引用类型实例的 Swift 常量或者变量，与 C 语言中的指针类似，但是并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用。Swift 中的这些引用与其它的常量或变量的定义方式相同

//4 类和结构体的选择:结构体实例总是通过值传递，类实例总是通过引用传递 这意味两者适用不同的任务。当你在考虑一个工程项目的数据结构和功能的时候，你需要决定每个数据结构是定义成类还是结构体
//符合一条或多条以下条件时 使用结构体的准则: 1 该数据结构的主要目的是用来封装少量相关简单数据值 2 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用 3  该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用 4 数据结构不需要去继承另一个既有类型的属性或者行为


//5 字符串、数组、和字典类型的赋值与赋值行为:

//Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。

//Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。


























































