//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 闭包
 */
//闭包是自包含的函数代码块 可以在代码中被传递和使用 与OC中的Block类似，闭包主要用于异步操作执行完成后的代码回调，网络访问结果以参数的形式传递给调用方

//闭包可以捕获和存储其所在的上下文任意的常量和变量的引用 称为包裹常量和变量 swift管理在捕获过程中涉及到的所有内存操作

//闭包采取三种形式:
//1 全局函数是一个有名字但不会捕获任何值的闭包
//2 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
//3 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文常量和变量的匿名闭包

//闭包表达式拥有简洁的风格 并鼓励在常见的常景中进行语法优化:1 利用上下文推断参数和返回值类型 2 隐式返回单表达式闭包 即表达式闭包可以省略return关键字 3 参数名称缩写 4 尾随闭包语法

//1 闭包表达式:闭包表达式是一种利用简洁语法构建内联闭包的方式。闭包表达式提供了一些语法优化，使得撰写闭包变得简单明了

//1.1:sorted方法:它会根据你所提供的用于排序的闭包函数将已知类型数组中的值进行排序 如下面的方法 sorted(by:)方法接受一个闭包 该闭包函数需要传入与数组类型相同的两个元素和返回一个bool类型的值 表示传入的参数比较后的结果情况 因此排序闭包函数类型为:(string,string) -> bool
//创建一个父类闭包函数类型的函数  将改函数作为排序sorted(by:)的参数传入使用
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String,_ s2: String) -> Bool{
    
    return s1 > s2
}
var result = names.sorted(by: backward)



let names1 = [2,3,4,5,6]
func backward1(_ s1: Int, _ s2: Int) -> Bool{
    
    return s1 > s2
}
var result1 = names1.sorted(by: backward1)

//利用闭包表达式语法可以更好地构造一个内联闭包
//2 内联闭包表达式:闭包表达式语法有如下的一般形式:
/*
  { (parameters) -> returnType  in
 
    statements
 }
 */
//闭包表达式的参数可以是in-out参数 但是不能设置默认值 也可以使用可变参数(1.可变参数就是可以输入零个或者N个参数值,2.必须将可变参数放在参数的最后一位 不然出现编译错误) 元组也可以作为参数和返回值
//可以将上面的闭包函数调用如下处理

var result3 = names.sorted(by: { (_ s1: String, _ s2: String) -> Bool in
    
     return s1 > s2
})
//内联闭包参数和返回值类型和上面的函数 backward、backward1的声明一致 然而在内联闭包表达式中,返回值类型都写在大括号内，而不是大括号外 闭包的函数体部分由关键字in引入 该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始 然后sorted(by:)的方法调用依旧不变 一对圆括号任然包裹着整个方法的参数 只是参数变成了内联闭包

//2.1 根据上下文推断类型:因为排序闭包函数作为sorted(by:)方法的参数传入的 swift可以推断其参数和返回值类型 所以swift会去推断闭包函数的参数和返回值的类型  所有我们可以省略掉参数类型和返回值类型
//内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包表达式的参数和返回值类型 这意味着闭包作为函数的或者方法的参数时 你可以不需要完整的格式构造内联闭包
var result4 = names.sorted(by: {s1,s2 in
    
    return s1 > s2
})

//2.2 单表达式闭包隐式返回: 单表示式闭包可以通过省略return关键字来隐式的返回单表达式的结果
var result5 = names.sorted(by: { s1,s2 in s1 > s2 })

//2.3 参数名缩写:swift自动为内联闭包提供参数名缩写功能 你可以直接使用 $0、$来顺序的调用闭包函数 以此类推 如何你在参数中使用参数缩写 你也可以在参数定义省略参数列表 in的关键子也可以省略
var result6 = names.sorted(by: {$0 > $1})

//2.4 运算符方法: Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合
var result7 = names.sorted(by: >)


//3 尾随闭包:如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数 可以使用尾随闭包来增强函数的可读性 尾随闭包是一个书写在函数括号之后的闭包表达式 函数支持将其作为最后一个参数调用
//内联闭包和尾随闭包的区别:内联闭包将闭包作为参数写在函数的参数内部用()包裹起来 尾随闭包则直接将闭包整体放在函数外部 两者是不同的闭包表达式
var result8 = names.sorted() {$0 > $1}
//如果闭包是函数的唯一的参数 则可以省略函数()
var result9 = names.sorted {$0 > $1}


//4 值捕获:闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值
//以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。嵌套函数可以捕获其外部函数(也就是嵌套它的函数内部的所有值 包括参数 常量 变量)所有的参数以及定义的常量和变量
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    
    var runningTotal = 0
    
    func incrementer() -> Int {
        
        runningTotal += amount
        
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

//调用incrementer方法是 里面的函数体每次都会调用runningTotal 和 amount变量和参数值 这表明:嵌套函数就是闭包. 如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift可能会改为捕获并保存一份对值的拷贝。 Swift也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量
incrementByTen()
incrementByTen()
incrementByTen()



//如果你创建了另一个 incrementer，它会有属于自己的引用，指向一个全新、独立的 runningTotal 变量
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()

//注意:如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用。Swift使用捕获列表来打破这种循环强引用

//5.1 闭包是引用类型:上面使用常量接受闭包的函数值 发现常量的值在每一次调用后依旧可以增加其捕获的变量值 因为闭包和函数都是引用类型
// 无论你将函数或者闭包赋值个一个常量还是变量 其实是设置这个常量或者变量对这个函数或者闭包的引用 而并非指的是闭包或者函数内容本身 这就意味着你将闭包赋值给两个不同的常量或者变量 两个值都会指向同一个闭包

//两者都是闭包赋值的常量 指向同一个闭包
let newincrementByTen = incrementByTen
newincrementByTen()


//5.2 逃逸闭包:当一个闭包作为参数传到另外一个函数中去的时 但是这个闭包在函数返回之后才执行 我们称该闭包从函数中逃逸。在定义闭包作为函数的参数时候 在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的
//一种可以将闭包逃逸出函数的办法是 将闭包保存在一个外部定义的变量中
//将闭包保存在completionHandlers数组中 数组存储的就是闭包 闭包类型是()->Void(也可以认为是一个函数类型 因为函数就是特殊的闭包) 在参数名前面添加@escaping来表示闭包可以被逃逸
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void){
   //调用闭包 执行闭包函数体代码
    closure()
}

//将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用self
class SomeClass
{
    var x = 10
    func doSomething()
    {
        //闭包其实类似于OC的Block
        someFunctionWithEscapingClosure{
            self.x = 100 //显示的使用self
        }
        someFunctionWithNonescapingClosure{
            x = 200      //隐式的使用self
        }
    }
}

let instance = SomeClass.init()
instance.doSomething()
print(instance.x)

//获取数组内存储的闭包(first 会返回一个可选类型)
let completionMethod: (() ->Void)? = completionHandlers.first
//调用闭包方法  执行闭包函数体内方法
completionMethod?()
print(instance.x)

//6.1 自动闭包:自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式 这种闭包不接受任何参数，当被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包 当闭包的方法调用时候才会去执行这个闭包函数体内内的代码 不调用是不会执行的

//自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。延迟求值对于那些有副作用（Side Effect）和高计算成本的代码来说是很有益处的，因为它使得你能控制代码的执行时机

//尽管在闭包的代码中，customersInLine 的第一个元素被移除了，不过在闭包被调用之前，这个元素是不会被移除的。如果这个闭包永远不被调用，那么在闭包里面的表达式将永远不会执行，那意味着列表中的元素永远不会被移除  该闭包的类型是 () ->String类型

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
//类似声明闭包 闭包代码是移除数组第一个元素
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
//调用闭包代码 执行代码  不调用永远不会执行
print("Now serving \(customerProvider())!")

print(customersInLine.count)


//显式的闭包 有{}包裹这代码表示是显示闭包表达式
//一般闭包都是作为函数的参数使用
func serve(customer customerProvider1: () -> String)
{
    //调用时候才会执行serve内部的代码
    let name = customerProvider1()
    print(name)
}

serve{
    customersInLine.remove(at: 0)
}
//当调用闭包函数时候 开始执行闭包内部函数代码 { customersInLine.remove(at: 0) }


//隐式闭包:通过将参数标记为 @autoclosure 来接收一个自动闭包 当你定义函数声明隐式闭包时候 调用函数传入的闭包参数时候不在是一个闭包类型 而是一个其他类型(比如 String Int等) 你可以将该函数当作接受 String类型参数（而非闭包类型）的函数来调用 customerProvider2 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性 过度使用 autoclosures 会让你的代码变得难以理解

//隐式闭包不能使用 serve{customersInLine.remove(at: 0)}这种显示闭包的形式 因为参数传入不是闭包类型而是String类型(这个类型跟你定义函数时候闭包类型相同 () -> String 因为闭包返回的类型只的就是你传入的类型)
func serve(customer customerProvider2: @autoclosure () -> String) {
   
    print("Now serving \(customerProvider2())!")
}
serve(customer: customersInLine.remove(at: 0))

//如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}






