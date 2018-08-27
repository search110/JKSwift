//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
  字符串和字符
  字符串:有预的character(字符)类型的集合 通过String类型来表达 读取方式很多 包括作为一个字符类型的集合 String是一种快速、现代化的字符串实现 每一个字符都是由与Unicode无关的字符组成 String与Foundation框架的NSString进行了无缝桥接 foundation也可以对String进行扩展 暴露在String定义方法中 两者调用不需要转化类型
 */

//1 字符串的字面量 可以作为字符串常量或者变量的初始值
"stringLiteral"

//2多行字符串字面量 一个多行字符串字面量包含了所有的在开启和关闭引号（"""）中的行
let singleLineString = "These are the same."
let multilineString = """
These are the same
"""
//如果你的代码中，多行字符串字面量包含换行符的话，则多行字符串字面量中也会包含换行符。如果你想换行，以便加强代码的可读性，但是你又不想在你的多行字符串字面量中出现换行符的话，你可以用在行尾写一个反斜杠(\)作为续行符
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

//3 字符串字面量的特殊字符  转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
// Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496

//4 初始化空字符串:初始化一个空的初始值 可以将空的字符串字面量赋值给变量 也可以初始化一个新的String实例
var emptyString = ""
var anotherEmptyString = String() //初始化方法

//5 字符串的可变性  可以将字符串分配给一个变量或者常量来定义字符串的可变性
var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"

//let constantString = "Highlander"
//constantString += " and another Highlander"
// 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。

//6 字符串是值类型: Swift中的String类型是值类型 创建新的字符串时 当进行赋值操作或者函数方法传递 会进行值的拷贝 任何情况下会对已有的字符串进行创建新的副本,swift默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值,很明显无论该值来自于哪里，都是您独自拥有的。 您可以确信传递的字符串不会被修改，除非你自己去修改它

//7 字符的使用
for character in "hello"{
    
    let char: Character = character
    
    print(character)
}

//字符串可以通过字符的数组进行初始化
let charS: [Character] = ["h","e","l","l","o"]
let characterString = String(charS)
print(characterString)

//8 将字符添加到字符串的尾部可以使用 append()方式添加
var stringValue = "hello"
var characterValue = "!"
stringValue.append(characterValue)

var stringvalue_1 = "hello"
let characterValue_1 = "!"
stringvalue_1.append("hello")

characterValue.append(characterValue_1)

//8 字符串插值 插值字符串中写在括号中的表达式不能包含非转义反斜杠 (\)，并且不能包含回车或换行符 不过，插值字符串可以包含其他字面量
let count = 2
print("this string count \(count)")

//9 计算字符数量 计算字符串中的character的count 使用属性count
let stringCount = "hello wworld!"
print("This string have character is \(stringCount.count) number")

// 注意: 通过count属性返回的字符数量并不总是与包含相同字符的NSString的length属性相同。NSString的length属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集

/*10 “每一个字符串都有一个关联的索引index类型 这个index对应着每个character(字符)在字符串的位置,使用startIndex属性可以获取String中第一个Character的索引。使用endIndex属性可以获取String最后一个Character的"后一个位置的索引".所以endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的
  10.1: String 的 index(before:) 得到前面或后面的一个索引
  10.2: index(after:)  得到后一个索引
  10.3: index(_:offsetBy:) 取对应偏移量的索引
 */
let greeting = "Guten Tag!"
//startndex 获取character对应的index

greeting[greeting.startIndex]
//endIndex属性可以获取最后一个Character的"后一个位置的索引
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(greeting.startIndex, offsetBy: 2)]
greeting[greeting.index(after: greeting.startIndex)]

/*11 indices: 会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符(indices 同样适合使用在Array Dictionary  Set 中)
 */
for index in greeting.indices {
    print("greeting character \(greeting[index])")
}

/*12 插入和删除
 */
var addString = "hello"
//插入单个字符
addString.insert("!", at: addString.endIndex)
//插入一段字符串
addString.insert(contentsOf: "word", at: addString.index(before: addString.endIndex))
//移除单个字符
addString.remove(at: addString.index(before: addString.endIndex))

//根据range范围来移除子字符串
let range = addString.index(addString.endIndex, offsetBy: -4) ..< addString.endIndex
addString.removeSubrange(range)
//移除全部
addString.removeAll()
var subString = "subString"
//paramter false 释放初始化的内存  true 保利初始化的内存
subString.removeAll(keepingCapacity: true)
subString + "1"

/* 13 子字符串:根据swift的方法可以获取对应的子字符串 子字符串和String拥有同样的功能  但是子字符串使用在临时操作 不能长时间保持(因为子字符串会重用父类字符串的内存(共用同一片内存) 导致父类字符串不用时候不能释放 直到子类字符串不不再被使用为止) 如果需要长时间保持可以将子字符串转化为实例
 */

let greetingValue = "hello,word!"
//获取传入字符在String中的index（可选类型）
let index_v = greetingValue.index(of: ",")
let indexV =  index_v ?? greetingValue.endIndex
//子字符串
let sub_string = greetingValue[..<indexV]
//子字符串实例化
String(subString)
print(subString)

//获取子字符串
let newSub = greetingValue.prefix(5)
let newSub1 = greetingValue.suffix(5)
let newSub2 = greetingValue.prefix(upTo: greetingValue.endIndex)
let newSub3 = greetingValue.suffix(from: greetingValue.startIndex)

/*14 字符串的比较: 1 字符串的字符相等 2 字符串的字符前缀相等 3 字符串字符后缀相等
 */
//字符串/字符可以使用==或者!=来比较
let squelString1 = "I am boy"
let squelString2 = "I am boy"

if squelString1 == squelString2 {
    
    print("equel")
}else{
    print("is different")
}

//字符串hasPrefix(_:)/hasSuffix(_:)判断字符串是否存在同样的前缀或者后缀
let httpsString = "https://www.baidu.com"

if httpsString.hasPrefix("https://"){
    
    print("true")
}else{
    print("false")
}

if httpsString.hasSuffix("com"){
    
    print("true")
}else{
    print("false")
}


