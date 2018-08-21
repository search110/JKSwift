//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Swift中的String和NSString的共同点和区别
/*1 String保留了大部分NSString的API的功能
   1.1:.hasPrefix
   1.2:.lowercaseString
   1.3:.componnetsSeparatedByString
   1.4:.substringWithRange
 开发中使用两者都可以
 
1.NSString是引用类型 String则是值类型
 两者都可以使用累命来初始化 虽然写法一致但是 NSString初始化了一个指针指针这个字符串 String则是把字符串的字面量赋值给了字符串
 
 2.String中的字符串的拼接比NSString更为简单
 
 3 String可以实现字符串遍历循环
 
 4
 
 
*/

//2 String中的字符串的拼接比NSString更为简单
var strA = "My name"
var strB = " is dsx"
strA = "My name" + " is dsx"
strA = strA + strB
print(strA)

//3 String可以实现字符串遍历循环
let charaterValue = "12345667889"

for _ in charaterValue
{
    
}












