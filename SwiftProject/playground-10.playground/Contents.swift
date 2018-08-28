//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 函数
 */
//函数是完成一段独立任务代码的片段 你可以使用命名来标识某个函数的功能 这个名字可以用来在需要使用这个“函数功能”的时候调用 swift的函数非常的灵活 可以表示任何的函数 包含没有参数的C函数风格的函数 包括复杂的带局部和外部参数名的objective-c的风格参数 参数可以提供默认值来简化函数的调用 参数还可以做传入的参数 也可以当做传出的参数使用
//swift中 函数也是存在类型的:函数的类型是由参数类型和返回值类型组成的类型 你可以将函数的类型当做其他变量类型一样处理、也就可以将函数当做别的函数的参数来使用、同时也可以将函数当做另外一个函数的返回值来处理、函数的定义同样可以写在其他的函数定义当做 这样可以达到功能封装的要求
//1 函数的定义和调用:当你定义一个函数的时候 你可以定义一个或者多个有名字和类型的值 作为函数的参数 也可以定义某种类型的值作为函数的返回值类型 函数名是用来描述某个函数功能的方法名 条用函数时候需要传入与函数匹配的的输入值(实参)
//返回值不需要定义昵称 但需要定义返回值的类型 (_)表示匹配任何类型
func greet(person:String)-> String{
    
    let greeting = "Hello, " + person + "!"
    return greeting
}

//以上所有大的信息的汇总就成为函数的定义 并且以func作为函数的前缀 返回值:使用->后面跟着返回值类型的名称方式来表示返回值
let returnValue = greet(person: "ccaoya")

//2 函数参数和返回值:函数的参数和返回值在swift中很灵活的 你就可以定义任何类型的函数 包括只带一个未命名的参数简单函数到复杂的带有表达性的参数名和不同参数选择项的复杂函数
//2.1 无参函数
func sayHelloword() -> String{
    
    return "helloword!"
}
print(sayHelloword())

//2.2 多参数的函数 在括号内使用逗号分割来区别传入的参数值和类型 当函数定义的参数个数的不同的时候 函数名可以相同
func greet(person:String,alreadyGreed:Bool) -> String{
    
    if alreadyGreed
    {
        return "already greet"
    }else{
       
        return greet(person: person)
    }
}

print(greet(person: "caoya", alreadyGreed: true))

//2.3 无返回值的函数:函数可以无返回值  当函数不需要返回值的时候可以选择不返回值 不需要定义返回箭头和返回类型 没有定义返回值类型会返回一个特殊的void值 它其实是一个空元组 没有元素 可以写成()
func greet1(person:String) ->(){
    
    print("hello \(person)!")
}
greet1(person: "caoya")

func greet2(person:String){
    
    print("hello \(person)!")
}
greet2(person: "caoya")
//函数的返回值可以被忽略不用 返回值可以被忽略 但是定义了返回值的函数必须返回一个值 如何没有返回值导致编译错误
func ignorFunc(string:String)->(){
    
    let _ = greet(person: string)
}
print(ignorFunc(string: "caoya"))

//2.4 多重返回值的函数:可以用元组类型让多个值作为一个复合值从函数这种返回 元组的成员不需要在元组从函数中返回时命名，因为它们的名字已经在函数返回类型中指定了
func minMax(array:[Int]) -> (min:Int,max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [1,2,0,4,9,3,2])

print(bounds.min,bounds.max)

//2.5 可选元组返回类型:当元组返回的类型可能没有值 你可以使用可选元组类保证没值的时候返回nil 可选元组(Int,Int)? 和元组包含可选值(Int?,Int?)是不同的概念 可选元组是整个元组可选 包括值可选 可选元素是只有值可选类型 可以将上面的元组返回值定义成可选类型

//返回值为可选类型元组
func minMax1(array:[Int]) -> (min:Int,max:Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//使用可选绑定来解包可选类型
if let bounds = minMax1(array: [1,2,0,4,9,3,2])
{
  print(bounds.min,bounds.max)
}

//3 函数参数标签和参数名称:每一个函数参数都有一个参数标签(参数标签在每个参数名称的前面定义)和参数名称 参数标签在调用函数的时候使用 调用的时候需要将函数标签写在对应的参数前面 参数名称在函数的实现中使用 默认情况下参数名称和参数标签用同一个名称表达func some(someFunction:Int) 中参数标签和参数名称都是someFunction
//函数的参数名称都必须保持独一无二的昵称 多个参数可以拥有同样的参数标签 但是一个唯一的参数标签可以提高代码的可读性

//3.1指定参数标签:你可以在参数前面指定参数的标签 以空格分隔
func someFunction(argumentlabel paramterName:Int)->(){
    
    print(paramterName)
}

someFunction(argumentlabel: 2)

//3.2 参数1:参数名称和参数标签相同 参数2:参数名称:hometown 参数标签:from
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
//3.3 忽略参数标签 可以使用(_)表示忽略某个参数的参数标签
func someFunction1(_ firstParamter: Int,sencodlabel sencondParameter: Int) -> (){
    
    print("paramter1==\(firstParamter) paramter2==\(sencondParameter)")
}

someFunction1(1, sencodlabel: 2)

//3.4 默认参数值:你可以在函数体中给参数赋值来为任意的一个参数定义默认的值 当设置默认值的时候 当条用函数的时候可以忽略参数值(同时也可以传入值)
func someFunction2(paramterOutDefaults:Int,paramterDefaults:Int = 10) -> (){
    
    print(paramterOutDefaults + paramterDefaults)
}

someFunction2(paramterOutDefaults: 10)
someFunction2(paramterOutDefaults: 10, paramterDefaults: 2)


//3.5 可变参数: 一个可变参数可以接受零个或者多个值 函数调用的时候你可以指定函数参数可以传入不确定个数的值(传入的时候使用逗号隔开) 通过在变量参数类型后面添加(...)的方式来定义可变参数 可变参数的传入值在函数体中变为此类型的一个数组 一个函数最多还能存在一个可变的参数
func arithmeticMean(_ numbers: Int...) -> Int{
    
    var total: Int = 0
    for number in numbers {
        total += number
    }
    return total/numbers.count
}

print(arithmeticMean(2,3,4,5,6))

print(arithmeticMean(100,1000,10000,100000))

//3.6 输入输出参数:函数的参数默认值是常量 当你在函数体内修改参数值的时候会出现编译问题 如果你想修改一个参数的值时候 并且想要这些修改后的参数值在函数结束后依旧存在  那应该把这个参数定义为输入输出参数

//定义输入输出参数 在参数的类型前面添加inout关键字 (传入传出参数的作用:)一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值 原来值会被修改 不能使常量值和字面量 并且调用函数时候需要在参数前面添加&符号表示这个值是可以被函数修改的 输入输出参数是函数对函数体外产生影响的另一种方式 和返回值不一样
//注意:输入输出参数不能存在某认值、而且不能在变量前面添加 inout关键字
func swapsTwoInts(_ a: inout Int,_ b: inout Int){
    
    let temporaryA = a
    a = b
    b = temporaryA
}

 var someInt = 3

 var anotherInt = 107

swapsTwoInts(&someInt,&anotherInt)

print("someInt == \(someInt) anotherInt ==\(anotherInt)")


//4 函数类型:每个函数都有种特定的函数类型、函数的类型由函数参数类型和函数返回值类型组成

//这个函数类型有两个 Int 型的参数并返回一个 Int 型的值
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

//没有参数，并返回 Void 类型的函数
func printHelloWorld() {
    print("hello, world")
}

//4.1 使用函数类型:使用函数类型和其他的类型使用一样、你可以定义一个类型为函数的常量或者变量 并赋值给定义的常量或者变量一个适当的函数值
//4.2 赋值过程在 Swift 类型检查(type-check)中是允许的
var mathFunction: (Int,Int) -> Int = addTwoInts
print(mathFunction(2,3))

//4.3 有相同匹配类型的不同函数可以被赋值给同一个变量，就像非函数类型的变量一样
mathFunction = multiplyTwoInts
print(mathFunction(2,3))

//4.4 同样可以使用类型推断来推断函数类型赋值变量或者常量的类型
let mathFuntion1 = multiplyTwoInts
print(mathFuntion1(4,5))

let mathFuntion2 = addTwoInts
print(mathFuntion2(4,5))


//重点
//4.5 函数类型:(Int,Int) -> Int 可以作为另外一个函数的参数类型:用 (Int, Int) -> Int 这样的函数类型作为另一个函数的参数类型

//列如下面的func:调用的时候你可以在第一个参数中传入任何这种类型的函数 函数的作用就是输出另一个适当类型的数学函数的调用结果 不关心传入函数是如何实现的，只关心传入的函数是不是一个正确的类型 能以一种类型安全（type-safe）的方式将一部分功能转给调用者实现(函数类型作为一个函数的参数可以理解为:传入的就是一个符合这种函数类型的一个函数 内部可以利用函数处理数据)
func printMathResult(_ mathFunction: ((Int, Int) -> Int), _ a: Int, _ b: Int) {
   
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)


//4.6函数类型作为返回值类型:用函数类型作为另一个函数的返回类型 需要在返回箭头（->）后写一个完整的函数类型
// 1 作为返回值类型的这个函数类型可能存在这参数类型和返回值类型:  -> (Int)->Int)
// 2 作为返回值类型的这个函数类型可能不存在这参数类型: ->()->Int
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

//函数类型作为返回值类型其实就是返回一个函数
func chooseStepFunction(backward: Bool) -> ((Int) -> Int) {
    
    return backward ? stepBackward : stepForward
}
//调用函数: 将函数赋值给一个常量 该常量为函数类型
let moveNearerToZero = chooseStepFunction(backward: true)

print(moveNearerToZero(1))


//5 嵌套函数:上面所有的函数都叫全局函数 因为定义在全局域中 你也可以把函数定义在别的函数体中 叫做嵌套函数
//一般情况下 嵌套函数是对外界不可见的 但是可以被它的外围函数（enclosing function）调用 外围函数指的就是包含定义在它内部的嵌套函数的外面这个函数
//外围函数可以返回它的某一个嵌套函数 这样这个嵌套函数可以在其他域中被使用

func chooseStepFunction1(backward: Bool) -> ((Int) -> Int)
{
    //嵌套函数
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    //外围函数调用嵌套函数 并返回嵌套函数
    return backward ? stepBackward : stepForward
}

var currentValue = -4
//获取嵌套函数 该常量为函数类型
let moveNearerToZero1 = chooseStepFunction(backward: currentValue > 0)

print(moveNearerToZero1(2))
















