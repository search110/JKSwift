//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
  1: 错误处理
  2: 断言和先决条件
 */

/*
  1: 错误处理处理程序执行中可能会遇到的错误条件
     关键字: throws 函数可以添加关键词来抛出错误消息 当函数可能会抛出错误时候需要在表达式中前置try关键词
      方法：1.1 do-try-catch 1.2 try?:对于有返回值的throws函数、使用try？会把结果转换为可选
 */

func canThrowError() throws -> Bool{
   //函数可能会出错
    return true
}
//1.1
do {
    try canThrowError()
    // 没有错误消息抛出 执行什么操作函数
    // beginSuccessFunction()
} catch
{
  // 有一个错误消息抛出 执行什么函数或者操作
  // beginErrorFunction()
}
//1.2
if (try? canThrowError()) != nil{
  print("successf")
}else{
    print("failuer")
}

/*
  2.1: 断言:运行时候做的安全检查、检查在执行后续代码之前是否满足了一个必要的条件
           满足 代码继续执行 未满足 则代码执行结束 断言并不是用来处理可以恢复或者可预期的错误 断言仅在调试环境运行
 */
let age: Int = -3
//当判断条件不对时候会出现程序终止
//assert(age > 0, "age can not be less than zero")
assert(age < 0, "age can not be less than zero")
//assertionFailure() 表明断言失败
if age > 0
{
    assertionFailure("assert failure")
}

/*
 2.2: 先决条件: 先决条件和断言都是用来检查程序是否满足一个必要条件 先决条件在调试环境和生产环境中运行
 */
//当一个条件可能为false（假），但是继续执行代码要求条件必须为true（真）的时候，需要使用先决条件。例如使用先决条件来检查是否下标越界，或者来检查是否将一个正确的参数传给函数
let name: Int = -1
precondition(name < 0, "age must be less than zero")
//先决条件失败函数调用
if name > 0
{
   preconditionFailure("failure")
}
















