//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 1. 赋值
 2. 空合并运算
 3. 数值型字面量和数值型类型
 4. 类型别名 typealias
 5. BOOL 值 true && false
 6. Print()
 7. 元祖 Tuples
 8. Any AnyObject
 */

/*
 1.1: 不能连续的赋值 加括号连续的赋值同样不行
 */
var a = 9
let b = 10
var d: Int
a = 6
//d = a = 10
//d = (a += 6)
print("a的值%d",a);

//类型推断为Int类型(类型推断根据初始化的值)
let test = 10
// 确认类型为Int类型 未初始化
let test1: Int;
//当类型明确时候 类型推断无用
//let testString: String = 1
//如果在需要使用BOOL值的地方使用了非BOOL值 swift的默认机制规则会报错 不能通过
//if a {}
if a==6
{
    print("is ture");
}

/*
 2.1 空合并运算 （a ?? b） (a!=nil ? a! :b) 将对可选类型a进行空判断  如果a包含了一个值就进行解包 否则返回一个默认的的b值
     两个条件: 表达式a必须为可选类型 默认值b和可选类型a的值的类型必须保持一致
     ??是非常有用的操作符 可以对nil进行快速的判断
*/
var level = 1
var level_value: Int?

var currentLevel = level_value ?? level
print("currentLevel Value==\(currentLevel)")

// ?? 运算符的优先级等级低于 + 号等级 注意使用的时候添加括号
let name: String? = "老曹"
let name1: String? = nil

print(name ?? ("" + "你好"))
print(name1 ?? ("" + "你好"))

//函数
func addNumber(x: Int?, y: Int?)
{
   //!强解包 无值时候会返回空
    if x != nil && y != nil
    {
        print(x! + y!)
    }
    // 使用if条件判断和 ??运算符的代码优势可以一览无余
    print((x ?? 0) + (y ?? 0))
}

/*
 3.1 代码中的整数常量和变量已知非0 最好使用int类型来统一 使用默认的整数类型可以保证整数变量和常量可以直接被复用并且可以匹配整数类字面量的类型推断
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

/*
  4.1 类型别名 type aliases swift中可以使用关键字typealias定义别名
 */
typealias sampleNameINT =  UInt8

let maxValueUInt8 = sampleNameINT.max

/*
  5.1 布尔值 bool true && false  当初始化给变量或者常量赋值为true或者false时候 可以不用指明类型 swift进行类型推断
      布尔值只能是true或者是false 不能表示非0即真
 */
let bool1 = false
let bool2 = true

let boolValue = 1

if boolValue==1
{
    print("boolValue==1 判断后为BOOL类型")
}
//if boolValue{} 这样判断是错误的 Swift为强语言类型 判断只能是BOOL类型 如果是0或者1会报错 boolValue不是BOOL类型
/*
   6.1 输出
 */
var variabletextOutputStream = "what is mean"
let constanttextOutputStream = "constanttextOutputStream"

print(2,3,4)
print(2, 3 ,4, separator: "-", terminator: "!")
print("variabletextOutputStream", to: &variabletextOutputStream)
print(variabletextOutputStream)
//textOutputStream 输入输出参数你只能传入可变参数 不能传入常量或者字面量
//print("what is mean", to: &constanttextOutputStream)

/*
  7.1 元组(Tuples)
      元组使用圆括号把多个值组成一个复合值，元组内的值可以是任意类型的值，元组并不要求元组内的值具有统一相同的类型
      元组类型是由N个任意类型数据组成(N>=0) 组成元组类型的数据可以叫元素
      元组可以理解为一种只能存放数据，却没有定义方法的轻量级数据结构
      作为函数返回值时，元组非常有用 跟一个类型的返回信息一个包含多个不同类型值的元组可以让函数的返回信息更有用
 */

let tuples1 = ("hello",1314)
print(tuples1)
print(tuples1.0,tuples1.1)
//7.2 变量名解绑:元组中的每一个元素可以指定对应的名称 如果没有指定名称的元素也可以使用下标类进行数据的读取
let tuples2 = (x:"hello",y:1314,3.1415)

let tuples2_1 = tuples2.x
let tuples2_2 = tuples2.y
let tuples2_3 = tuples2.2

//7.3 下标解绑:元组中的元素同样可以是元组元素
let tuples3 = (2,("123",456,"789",5.678))

print(tuples3)
let tuples3_1 = tuples3.0
let tuples3_2 = tuples3.1.0
let tuples3_3 = tuples3.1.3

//7.4 元组类型中的数据只能修改 不能添加或者删除 Any类型的可以修改为任意的类型
//let来定义元组的话 那么就是常量 不能修改元素
var tuples4: (Int,String,Double,Any) = (2,"1",3.14,2)

print(tuples4)
tuples4.0 = 5  //修改为同一个类型
tuples4.1 = "1.1"
tuples4.3 = "我变了"  //类型改变
print(tuples4)

//7.5 在明确指定元素类型的情况中添加别名下 不能在元素内部加上元素名称
var tuples5: (name1:Int,name2:String) = (2,"string")
print(tuples5.name1,tuples5.name2)

//7.6 几个变量一旦联合在一起，组成了一个元组，他们就被“绑定”了，要想从一个元组中单独取出某一个数据时，需要解绑元组
//直接解绑:定义若干的变量直接和元组的元素一一对应
let tuples6 = (2,3,"4")
let (tuples6_0,tuples6_1,tuples6_2) = tuples6
print(tuples6_0,tuples6_1,tuples6_2)

//7.7 过滤解绑:对元组中的元素可以做选择性过滤 使用下划线表示忽略
let tuples7 = (2,3.14,"1")

let (A,_,B) = tuples7
print(A,B)

//两者表示0元素的元组
var to: () = ()
var to1: (Void) = ()
//一组元组元素 (其实就是String类型 使用t1.0访问会出问题)
var t1: (String) = ("string")
var t1_1: String = "string"

/*
 8.1  Any: 可以代表任何的类型 包括func方法类型   所以的类型(type)都隐式的实现了Any protocol协议
      AnyObject: 可以代表任何的class(对象)类型实例 所有的类都隐式的实现了 AnyObject protocol协议
      总结: AnyObject是Any的子集 所有的class关键字定义的对象都是AnyObject 所以的非关键字class定义的类型都是Any类型
 */






















































