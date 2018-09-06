//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 错误处理
 */
/*
 错误处理指的是响应错误以及从错误中恢复的过程、swift提供了在运行时对可恢复的错误的抛出、捕获、传递和处理的一系列操作功能的支持
 swift代码运行时无法保证总是执行完全部的代码总是生成有用的结果、可选类型表示值的缺失、但是当某个值操作失败的时候、最后能够知道失败的原因、从而可以做出相应的对应处理
 注意:Swift 中的错误处理涉及到错误处理模式，这会用到 Cocoa 和 Objective-C 中的NSError
  */
/*
 枚举的使用
 */
enum enumClass{

    case enumValue1
    case enumValue2(initValue: Int)
    case enumeValue3
}

//枚举的成员可以关联值(类似存储值的作用) 可以使用这个存储值在判断语句中使用
let enumBiandliang = enumClass.enumValue2(initValue: 10)
switch enumBiandliang {
    /*枚举的使用中不能case enumValue1 后面跟着case enumValue3 不处理值
      case .enumValue1:
      case .enumeValue3:
     swift中不可以这样做值的穿透
     */
    case .enumValue1:
        
      print("enumvalue1")
    
    case .enumValue2(let number):
        //使用枚举存储的关联值进行必要的数据处理
        if number > 9 {
           print(number)
        }
    case .enumeValue3:
      
        print("enumvalue3")
}

//枚举设置默认的初始值 初始值的类型为String类型(如果原始值为Int类型 定义第一个时候 会默认递增)
enum Person: String{
    
    case Tom = "Tom"
    case Jack = "Jack"
    case Dog = "dog"
}
//1 使用rawValue来访问枚举成员的原始值
let personName = Person.Tom.rawValue
//2 使用rawValue可以来创建一个枚举成员实例(返回的是枚举实例)
let personTom = Person(rawValue: "Tom")
//当枚举为定义的枚举成员时候 创建枚举实例将返回nil
let PersonCat = Person(rawValue: "cat")

/*
  1 表示并抛出错误
   swift中错误用符合“Error协议”类型的“值”(成员)来表示、这个空协议定义的值表明该类型的值可用于表明错误处理
 */
//Swift 的枚举类型尤为适合构建一组相关的错误状态
//枚举的原始值被定义为Error类型
enum VendingMachineError: Error {
    case invalidSelection                         //选择无效
    case insufficientFunds(coinsNeeded: Int)      //金额不足(关联值)
    case outOfStock                               //缺货
}
//swift抛出错误使用关键词throw
//抛出错误 设置默认值coinsNeeded的初始值

/*一旦抛出错误后面代码将不会执行
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
*/

/*
  2 处理错误
   某个错误被抛出的时候、附近的某部分代码必须负责处理错误 纠正这个问题、尝试另外一种方式、或者向用户报告错误信息
   swift处理错误有4种处理方式:
   1:将错误传递给调用该函数的代码(throwing 传递错误)
   2:用do-catch处理错误的语句
   3:将错误作为可选类型来处理
   4:或者断言该错误更本不会发生
 swift为了识别抛出错误的函数、方法、构造器的这些地方，在调用一个能抛出错误的函数、方法或者构造器之前，加上try关键字，或者try?或try!这种变体
 swift中的错误处理跟其他语言中的try-catch-throw的异常处理很相似 不同点事不涉及到解除调用栈 这是一个计算高昂的过程、就此而言throw语句的性能特性跟return语句相媲美
 */

//2.1 用throwing传递错误、将错误传递给调用的函数
/*为了表示一个函数、方法、构造器可以抛出一个错误、在函数声明的参数列表后面添加throws关键字、一个标识有关键字throws的函数被称为throwing函数、如果该函数指明了返回值类型、throws关键字需要写在箭头(->)的前面
  一个throwing函数可以在其内部抛出错误、并将错误传递到函数被调用时的作用域
 只有 throwing 函数可以"传递"错误。任何在某个非throwing函数内部抛出的错误"只能在函数内部处理"
 throw语句执行的话会立即退出方法，
 */
func cnaThrowErrors() throws -> String{
    
    return "throw"
}
func cnanotThrowErrors() -> String{
    
    return "not throws"
}



struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    //throws 表示该函数是一个throwing函数 可以传递错误的函数
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            //如果需要将错误传递出去必须使用throwing函数 但是也可以内部添加do-catch语句出来错误
            /*
            do {
                try <#throwing expression#>
            } catch <#pattern#> {
                <#statements#>
            }
            */
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}



let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
//buyFavoriteSnack 函数同意标记为可以传递错误函数 传到调用者
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    //try 标记该函数可以抛出错误
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    
    let name: String
    //throwing构造器能像throwing函数一样传递错误(构造器添加throws关键字表明是个可以传递错误的throwing函数)
    init(name: String, vendingMachine: VendingMachine) throws {
        
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

/*
  2.2 Do-catch出来错误
  可以使用do-catch语句来运行一段闭包代码处理错误 如果在do子句中的代码抛出了一个错误，这个错误会与catch子句做匹配，从而决定哪条子句能处理它
 do {
 try expression
 statements
 } catch pattern 1 {
 statements
 } catch pattern 2 where condition {
 statements
 }

 */

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
//该列子使用throwing和do-catch配合使用
do {
    // buyFavoriteSnack函数标记为可以抛出错误  并且添加关键字throws 表示该函数可以将错误传递出来 使用do-catch来匹配错误信息
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    
} catch VendingMachineError.invalidSelection {
    
    print("Invalid Selection.")
    
} catch VendingMachineError.outOfStock {
    
    print("Out of Stock.")
    
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

/*
 2.3 将错误转换成可选值
     使用try?通过将错误转换成一个可选值来处理错误 如果在评估try?表达式时候一个错误被抛出，那么表达式的值就是nil
 */

func someThrowingFunction() throws -> Int {
    //抛出异常
    throw VendingMachineError.invalidSelection
    //return 11
}

//使用try？将错误转换为可选值(someThrowingFunction()函数标记为throwing函数 可以传递错误)
let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}
//x y都是将错误转换为可选值返回nil
/*
 总结:
 1 如果上述的方法 someThrowingFunction()抛出错误 则x、y应该都会返回nil 否则x和y的值就是该函数的返回值
 2 无论someThrowingFunction()的返回值类型是什么类型，x和y都是这个类型的可选类型
*/


/*
  2.4 禁用错误传递
   某个throwing函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写try!来禁用错误传递 这会把调用包装在一个不会有错误抛出的运行时断言中 如果真的抛出了错误，你会得到一个运行时错误
 */

func loadImage(atPath: String){
    
}

let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")

/*
 总结:
 try:使用在一般的抛出错误的函数、方法调用前 标记为可以抛出错误 可以将抛出错误传递给调用函数
 try?:使用在一般的抛出错误的函数、方法调用前 标记为可以抛出错误 可以将抛出错误传递给调用函数 如果真的抛出错误则返回为nil 如果没有抛出错误 则返回对应的返回值的可选类型
 try!:禁止错误的传递、会将方法、函数包装成一个不会有错误抛出的函数
 */

/*
  3 指定清理
 1 使用defer语句在即将离开当前代码块时执行一系列语句 语句让你能执行一些必要的清理工作，不管是以何种方式离开当前代码块的——无论是由于抛出错误而离开，或是由于诸如return、break的语句 可以用defer语句来确保文件描述符得以关闭，以及手动分配的内存得以释放
 2 defer语句将代码的执行延迟到当前的作用域退出之前 延迟执行的操作会按照它们声明的顺序从后往前执行(就是手如果定义的第一个defer语句会在同一个方法的其他defer相比较会在最后一个执行)
 */

func processFile(filename: String) throws {
    
    if exists(filename) {
        
        let file = open(filename)
        //defer将代码的执行延迟到了改方法作用域即将退出之前执行defer内部的代码
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // 处理文件。
        }
        // close(file) 会在这里被调用，即作用域的最后。
    }
}








