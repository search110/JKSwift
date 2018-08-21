//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var a = 9

let b = 10

var d: Int

a = 6

//d = a = 10 不能连续的赋值 d = (a += 6) 加括号连续的赋值同样不行
print("a的值%d",a);

let test = 10 //类型推断为Int类型(类型推断根据初始化的值)
let test1: Int; // 确认类型为Int类型 未初始化
//let testString: String = 1  当类型明确时候 类型推断无用

//p条件语句的使用

//if a {} 如果在需要使用BOOL值的地方使用了非BOOL值 swift的黔南机制则会报错 不能通过
if a==6{
    print("is ture");
}

/*
  空合并运算 （a ?? b） 将对可选类型a进行空判断  如果a包含了一个值就进行解包 否则返回一个默认的的b值
 两个条件: 表达式a必须为可选类型 默认值b和可选类型a的值的类型必须保持一致
 ??是非常有用的操作符 可以对nil进行快速的判断
*/
var level = 1
var level_value: Int?

var currentLevel = level_value ?? level
print("currentLevel Value==\(currentLevel)")

// ?? 运算符的优先级等级低于 + 号等级 注意使用的时候添加括号
let name: String? = "老曹"
let name1: String? = nil  //可选类型可以赋值nil 非可选类型不可以

print(name ?? ("" + "你好"))
print(name1 ?? ("" + "你好"))


//函数
func addNumber(x: Int?, y: Int?)
{
   // print(x! + y!)  !强解包 无值时候会返回空 ?安全解包 无值时候可以返回nil 强解包会可能会导致奔溃
   // 使用if条件判断和 ??运算符的代码优势可以一览无余
    if x != nil && y != nil{
        
        print(x! + y!)
    }
    
    print((x ?? 0) + (y ?? 0))
}

//数值型字面量和数值型类型
/*
  代码中的整数常量和变量已知非0 最好使用int类型来统一 使用默认的整数类型可以保证整数变量和常量可以直接被复用并且可以匹配整数类字面量的类型推断
  推断浮点类型的时候 swift总是优先选择double而不是float
 */
//不同的整数类型的变量和常量可以存储不同范围的商数字
//let maxValue: Int8 = Int8.max +1 值超过最大值时候Error
let intValueMax: Int = Int.max
let intValueMin: Int = Int.min

let int8Max: Int8 = Int8.max
let int8Min: Int8 = Int8.min
let Uint8Max: UInt8 = UInt8.max
let Uint8Min: UInt8 = UInt8.min

//数值类型转化需要统一类型才可以相加  字面量其实是可以直接相加的 字面量没有明确的类型
let oneValue: UInt16 = 2
let twoValue: UInt8 = 2
//let threeValue = oneValue + twoValue 不同类型的值不能直接添加(必须转化为统一类型)
let threeValue: UInt16 = oneValue + UInt16(twoValue)
let fourValue: UInt8 = twoValue + UInt8(oneValue)

//浮点类型来初始化一个整数类型时 浮点类型的值会被截断
let three: Int = 3
let doubleV: Double = 3.14159
let multieValue: Int = three + Int(doubleV)

//类型别名 type aliases swift中可以使用关键字typealias定义别名
typealias sampleNameINT =  UInt8

let maxValueUInt8 = sampleNameINT.max

//布尔值 bool true && false  当初始化给变量或者常量赋值为true或者false时候 可以不用指明类型 swift进行类型推断
let bool1 = false
let bool2 = true

//输出
print(2,3,4)
print(2, 3 ,4, separator: "---", terminator: "!")

//元祖(Tuples)
































