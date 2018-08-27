//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
  流程控制结构
 */
//swift提供多种流程控制结构 比如多次执行任务的while 根据条件选择不同分支的 if、guard、switch语句、以及控制流程跳转的continue和break
//swift还提供了for-in来循环变量集合对应的数据 swift中的switch比较强大 可以匹配不同的模式 包括范围、元组、特定类型等一系列匹配
//1 for-in
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

//repeat-while，它和while的区别是在判断循环条件之前，先执行一次循环的代码块 然后重复循环直到条件为false

var b = 0
repeat{

   b += 1
   print(b)

} while b < 2


//3 条件语句 根据特定的条件执行特定的代码 当条件较为简单且可能的情况很少时，使用if语句。而switch语句更适用于条件较复杂、有更多排列组合的时候

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

//case 分支都必须包含至少一条语句 无关有case不存在语句则为无效分支(无效分支则需要带break) 判断无效分支时候还需要继续向下循环判断是否存在对应的分支数据
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "b": break // 无效，这个分支下面没有语句
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
//swift中的switch不会一起匹配多个条件判断 但是可以将需要匹配的多个条件写在同一个case中 组成复合匹配
let anotherCharacter1: Character = "a"
switch anotherCharacter1 {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}










