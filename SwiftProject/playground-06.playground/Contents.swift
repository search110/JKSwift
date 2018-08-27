//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 运算符:运算符是检查、改变、合并值的特殊符号和短语
       swift中赋值符只是简单的赋值操作 不会返回值 以防止把判断==相等的地方写成赋值符 造成程序崩溃 (+ - * / %)算数运算符会检查并不允许值的溢出 以此来来处理当变量值大于或者小于其类型所能承受的范围 导致崩溃
 描述 : 运算符分为一元运算符、二元运算符 三元运算符
    一元运算符分为:前置运算符 -a  后置运算符: a!
    二元运算符: a + b
    三元运算符: a ? b : c  三目运算符
 */

//1 赋值运算符
var a = 10
var b = 20
b = a

let (x,y) = (1,2)
// x = 1  y = 2

//2 算术运算符
let c = a+b
let d = b-a
let e = b * a
let f = b/a

//溢出运算符 &-  &+
let g = a &- b
let h = a &+ b

//3 求余运算
let m = 9 % 4
let j = -9 % 4

//4 一元负号符 一元正号符
let l = -6
let L_1 = -l
let L_2 = +l

//5 组合运算
var n = 1
n += 2
n -= 1

//6 标记运算符 比较运算符返回的都是表达式是否成立的布尔值
a == b
a > b
a < b
a != b

//7 元组元素的比较是否相同 比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的 Bool 不能被比较，也意味着存有布尔类型的元组不能被比较
(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
//(-1,true) < (1,false)

//8 三目运算符
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//9 空和运算符: (a ?? b)==(a != nil ? a! : b) 将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致
var v: Int?
let p = v ?? 1

var o: Int? = 2
let i = o ?? 1

//10区间运算符
//10.1 闭区间运算符 (a...b) 定义包含了a到b所有值的区间值
for index in 1...5 {
    print(index)
}
//10.2 半开区间运算符 (a..<b) 定义一个从a到b但是不包含b值的区间
for index1 in 1..<5 {
    print(index1)
}
//10.3 单侧区间 闭区间的另一种表达形式 可以表达往一侧无限延伸的区间 从开始的数值到数值全部结束所有的数值
let array: [Any] = ["jack0","jack1","jack2","jack3","jack4"]

for name in array[1...] {
    print(name)
}

for name1 in array[...1] {
    print(name1)
}

//10.4 半开单侧区间 附带上最终值
for name2 in array[..<2] {
    print(name2)
}

//11.1 逻辑运算符 逻辑非: !a 对布尔值取反
var bl: Bool = true
!bl

//11.2 逻辑与: a && b
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//11.3 逻辑或: a || b
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//组合逻辑
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
























