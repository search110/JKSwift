//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
  流程控制结构
 */
//swift提供多种流程控制结构 比如多次执行任务的while 根据条件选择不同分支的 if、guard、switch语句、以及控制流程跳转的continue和break
//swift还提供了for-in来循环变量集合对应的数据 swift中的switch比较强大 可以匹配不同的模式 包括范围、元组、特定类型等一系列匹配
//1 for-in 循环来遍历一个集合中的所有元素
//遍历数组获取数组元素
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
//遍历字典获取字典的key和value值 字典以元组的形式返回
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
//基本数据范围的遍历
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 使用下滑线_替代变量名来忽略对应的值
for _ in 1...3 {
    
    print(true)
}

//stride(from:to:by:)属于半开区间 左闭右开区间 函数跳过不需要的标记
let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval){
    // 每5分钟渲染一个刻度线 (0, 5, 10, 15 ... 45, 50, 55)
    print(tickMark)
}
// stride(from:through:by:) 闭区间
let hours = 12
let hourInterval = 3
for tickMark in stride(from: hourInterval, through: hours, by: hourInterval) {
    // 每3小时渲染一个刻度线 (3, 6, 9, 12)
    print(tickMark)
}

//2 while 循环 while循环会一直运行一段语句直到条件变成false。这类循环适合使用在第一次迭代前，迭代次数未知的情况下 while循环包含两中类型:
//1.while循环，每次在循环开始时计算条件是否符合；
//2.repeat-while循环，每次在循环结束时计算条件是否符合

//while循环
var i = 1
while i < 10 {
    print(i)
    i += 1
}

//repeat-while，它和while的区别是在判断循环条件之前，先执行一次循环的代码块 然后重复循环直到条件为false 类似do while
var b = 0
repeat{
   b += 1
   print(b)
} while b < 2


//3 条件语句switch 根据特定的条件执行特定的代码 当条件较为简单且可能的情况很少时，使用if语句。而switch语句更适用于条件较复杂、有更多排列组合的时候

// if 语句最简单的形式就是只包含一个条件，只有该条件为true时才执行
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// Switch switch语句会尝试把某个值与若干个模式（pattern）进行匹配  根据第一个匹配成功的模式，switch语句会执行对应的代码 swift中当case匹配成功对应的分支然后执行对应分支代码后会立即终止switch 不需要break来终止 但是依旧可以添加break

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

//case 分支都必须包含至少一条语句 如果有case不存在语句则为无效分支(无效分支则需要带break) 判断无效分支时候还需要继续向下循环判断是否存在对应的分支数据
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "b": break // 无效，这个分支下面没有语句
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
//swift中的switch可以组成匹配多个添加语句 将多个条件写在同一个case当做 使用逗号分开 组成复合匹配
let anotherCharacter1: Character = "a"
switch anotherCharacter1 {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
//swift中switch的区间匹配
let switchValue = 2
var switchV: String

switch switchValue
{
case 0..<5:
    switchV = "min"
case 5..<10:
    switchV = "max"
default:
    switchV = ""
}
print("switch value \(switchV)")

//元组(tuples):使用元组在同一个switch语句中测试多个值(元组的值可以是区间也可以是值) 元组中使用(_)来匹配所有的可能的值
let somepoint: (Int,Int) = (1,1)

switch somepoint
{
case (0,0):
     print("point is 0,0")
case (_,0):
    print("point is left max,0")
case (0,_):
    print("point is right max,0")
case (_,0):
    print("point is left and right max 0,0")
case (-2..<2,-2...2):
    print("point is left (-2..<2) and right (-2...2) max 0,0")
default:
    print("is not point")
}

//绑定值 case分支允许将匹配的值声明为临时的常量或者变量 并且可以在case分支的内部使用--这样的行为被称为绑定值(可以默认的认为声明的变量或者常量是可以匹配所以的可能的) 这个switch不包含default: 因为声明的常量,x y可以匹配一切元组的值
let anotherPoint = (2, 0)

switch anotherPoint
{
case (let x,1):
    print("x is true")
case (0,let y):
    print("x is true")
case let(x,y):
    print("x is true y is true")
}

//while case分支的条件语句可以添加while来做额外的添加判断
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint
{
case let (x, y) where x == y:
    
    print("(\(x), \(y)) is on the line x == y")
    
case let (x, y) where x < -y:
    
    print("(\(x), \(y)) is on the line x == -y")
    
case let (x, y) where x > y:
    
    print("(\(x), \(y)) is just some arbitrary point")
default:
    print("default value")
}

//符合匹配:当多个条件可以使用同一种方法来处理时候 可以将这几种条件的方法放在同一个case当中使用逗号隔开 当条件比较多的时候可以使用分行来写
let someCharacter1: Character = "e"
switch someCharacter1 {
case "a", "e", "i", "o", "u":
    print("\(someCharacter1) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter1) is a consonant")
default:
    print("\(someCharacter1) is not a vowel or a consonant")
}

//4 控制转移语句:改变你代码执行的顺序 实现代码大的跳转:continue、break、return、fallthrough、throw
//continue:告诉循环体 停止此次循环立刻开启下一次循环
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

//Break break语句会立刻结束整个控制流的执行。break 可以在 switch 或循环语句中使用，用来提前结束switch或循环语句
//当在一个switch代码块中使用break时，会立即中断该switch代码块的执行，并且跳转到表示switch代码块结束的大括号(})后的第一行代码
let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

//fallthrough:当case分支代码结束后天添加fallthrough可以继续代码下通到default分支中处理代码
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 20:
    description += " a prime number"
default:
    description += " an integer."
}
print(description)

//5 提前退出 guard的使用:guard的执行取决于一个表达式的布尔值 使用guard语句来要求条件必须为真时，以执行guard语句后的代码 不同于if语句，一个guard语句总是有一个else从句，如果条件不为真则执行else从句中的代码
//guard语句的条件被满足，则继续执行guard语句大括号后的代码。将变量或者常量的可选绑定作为guard语句的条件，都可以保护guard语句后面的代码
//如果条件不被满足，在else分支上的代码就会被执行。这个分支必须转移控制以退出guard语句出现的代码段。它可以用控制转移语句如return,break,continue或者throw做这件事

//6 检测APi的可用性:确保我们在当前的机器部署上不会使用不可用的API
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}





