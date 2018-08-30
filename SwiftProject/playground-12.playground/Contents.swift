//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 枚举
 */
//枚举:枚举值为一组相关的值定义了一个共同的类型值、你可以在代码中安全的使用你定义的枚举值
//swift中的枚举很灵活 不需要给每一个枚举成员提供一个枚举值、如果给枚举成员提供一个值 该值可以是字符串、浮点型、整型等
//swift中的枚举成员可以指定”任意类型“的关联值存储到枚举值中 每一个枚举成员都可以有适当类型的关联值 枚举类型是一等类型

//1 枚举的语法:使用关键字enum来定义枚举 定义放到大括号中 使用case关键字来定义一个新的枚举成员值 swift中的枚举值在创建时候不会赋予一个默认的整型值 这些枚举成员值本身就是完备的值、这些枚举值的类型就是定义好的SomeEnumeration类型
enum SomeEnumeration{
    
    case north
    
    case south
    
    case east
    
    case west
}

//多个成员可以出现在同一行上 每一个枚举定义了一个全新的类型跟swift其他的类型一样 他们使用开头字母大写 给枚举去一个单数的类型名而不是复数类型名方便理解枚举的作用
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//枚举创建的时候 枚举名就是一个类型 枚举成员都是该类型
var directionToHeard: SomeEnumeration = SomeEnumeration.east

//当变量类型确认时候 再次赋值可以省略枚举类型 直接使用.获取成员值
directionToHeard = .west

//2 使用switch语句匹配枚举值: 使用控制流程判断枚举成员时候 switch必须穷举所以的枚举值 如果忽略某些值就会导致编译无法通过 穷举确保了枚举成员值不会遗漏

directionToHeard = .east

switch directionToHeard{
    
case .north: print("north")
    
case .south: print("south")
    
case .east:  print("east")
    
case .west:  print("west")
    
}

//当不需要匹配全部的枚举成值的时候你可以使用switch中的default来涵盖不需要匹配的枚举成员值
let someplent: Planet = .earth

switch someplent {
case .earth:
    print("earth enum value")
default:
    print("other enum value")
}

//3 关联值:能够将其他类型的关联值和枚举成员值一起存储起来会很有用的 这能让你使用枚举成员值存储一些额外的自定义的信息 使用枚举成员值的时候 还可以修改这个关联值
//枚举定义关联值时候 在枚举成员值使用()括起来 里面定义关联值的类型 列如如下定义:
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
//当定义的常量或者变量等于Barcode类型的某个成员值时候可以对关联值进行赋值对应类型的值var
var procuctionccode = Barcode.upc(8, 9, 10, 11)
var procuctioncode1 = Barcode.qrCode("Barcode")

//可以使用关联的值进行代码功能的处理
switch procuctionccode {

case .upc(let firstcode,let sencodCode,let threeCode,let fourCode):

    print(firstcode,sencodCode,threeCode,fourCode)
    
case .qrCode(let barcode):
    
    print(barcode)
}

//当关联类型使用统一的变量或者常量定义时候可以将常量变量类型体出来
switch procuctioncode1 {
    
case let .upc(firstcode,sencodCode,threeCode,fourCode):
    // let 表示定义的关联值为常量
    print(firstcode,sencodCode,threeCode,fourCode)
    
case var .qrCode(barcode):
    //var 表示关联值定义为变量
    print(barcode)
}

//4 原始值:作为关联值的替代选择、枚举成员可以被默认值(称为原始值)预填充 而枚举成员原始值的类型必须相同
//枚举的原始值是在枚举定义的时候就被填充值的 枚举类型enumStringType的原始值的类型定义为String类型 枚举成员的原始值必须唯一不能重复(原始值的类型可以是、字符串、字符、整型、浮点型)
//对于特定的枚举成员它的原始值不会变化的 但是对于关联值是基于一个枚举成员值创建的常量或者变量值 关联值是可以变化的
enum enumStringTyppe:String{
    
    case firstType = "1"
    
    case sencondType = "2"
    
    case threeType = "3"
    
    case fourType = "4"
}

//4.1 原始值的隐式赋值:使用原始值为整型或者字符串类型的枚举时 不需要显示的为每一个枚举成员设置原始值 swift自动赋值 当使用的原始值类型为整型类型时候 隐式赋值默认依次递增1 如果第一个枚举成员没有设置默认值 默认是0 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称

enum Planet1: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//枚举成员值的默认值是对应的成员值的名称
enum CompassPoint: String {
    case north, south, east, west
}

//4.2 使用rawVlaue属性可以访问枚举成员的原始值
let planetValue = Planet1.mercury.rawValue

let compassValue = CompassPoint.north.rawValue


//5 使用枚举原始值初始化枚举实例:如果在定义枚举时候使用了原始值 也就个枚举定义了原始值 那么会自动的获取一个方法、这个方法接受一个教rawValue的参数 类型为定义枚举时候的初始值类型 返回值则为获取枚举成员值或者为nil(未获取到) 可以使用这个方法类创建一个新的枚举实例
//获取枚举成员值、注意返回值是可选类型
let possiblePlanet: Planet1? = Planet1(rawValue: 7)

let positionToFind = 11
if let somePlanet = Planet1(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


//6 递归枚举:递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression1 {
    case number(Int)
    case addition(ArithmeticExpression1, ArithmeticExpression1)
    case multiplication(ArithmeticExpression1, ArithmeticExpression1)
}







