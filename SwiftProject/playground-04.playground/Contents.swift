//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*、
 1 可选类型  解包
 2 类型推断  is
 3 对象类型转换  as  as! as?
 */

/*
 1.1 可选类型:swift中的可选类型是含有两种情况的枚举 None和Some(T) 表示有值和没有值的情况
 任何的类型可以明确的声明(或者隐式的转换)可选类型 当声明一个可选类型的时候，要确保用括号给 ? 操作符一个合适的范围
 可选类型可以为nil  非可选类型不行  二者可以同为空
 swift中的可选类型指的是可选类型的值不存在为nil
 如果代码中的常量和变量需要适配不存在的情况下 务必将他声明为恰当的可选类型
 可选类型如果不提供默认值 则该对象自动为nil
*/
let optionValue1: String? = ""
let optionValue2: String? = "optionValue2"
let optionValue3: Optional<String> = nil
let optionValue4: Optional<String> = "optionValue4"


//判断可选类型是否有值(不推荐使用)
if optionValue1 != nil
{
    print("optionValue1 is not nil")
}else
{
    print("optionValue1 is nil")
}

if optionValue3 != nil
{
    print("optionValue3 is not nil")
}else
{
    print("optionValue3 is nil")
}

//swift字符串的判断 当可选类型时候可以使用 String !=nil  非可选类型是使用isEmpty来判断
let stringValue1: String = ""
let stringValue2: String = "1"

if stringValue1.isEmpty
{
    print("stringValue1 is empty")
}else
{
    print("stringvalue1 is not empty")
}

if stringValue2.isEmpty
{
    print("stringValue2 is empty")
}else
{
    print("stringvalue2 is not empty")
}

/*
 1.2 !:强制解包(显示解包)使用的时候先判断是否不为nil(guard let判断) 当你确定自定义的可选类型一定有值的时候 可以使用操作符!来进行强制解析 拿到数据 !表示一定有值 当解析错误时候会报出运行错误
 */
let optionValue5: String? = "有值"

if optionValue5 != nil
{
    print(optionValue5!)
}

let optionValue6: String? = nil

if optionValue6 != nil
{  //不加判断就会出现运行错误
    print(optionValue6!)
}
/*
 1.3 隐式解包：把隐式解包的可选类型当成自动解包的可选类型 即不是每次在使用可选类型变量或者常量时候添加!号进行解析 而是定义的时候添加！ 在希望标为可选的类型名称后面，用感叹号(!)代替问号(?) 隐式解包使用在可选类型常量或者变量定义完成瞬间之后值一定存在 可以直接使用定义量值 不需要再次解包 主要用在类的初始化 XIB拖动的属性中
 */
let assumeString: String! = "hello"
print(assumeString)
print(assumeString.hashValue)

/*
 1.4 ?: 可选解包 一般用于调用方法的时候使用 判断是否为nil 如果为nil什么也不做 不为nil继续执行方法
        判断可选类型变量或者常量是否响应后面这个方法
 */
let optionValue10: String? = "hello"
let hasValaue = optionValue10?.hashValue

let optionValue11: String? = nil
let hasValaue1 = optionValue11?.hashValue


/*
 1.5 可选绑定: 避免频繁的使用判断来判断是否赋值而为非nil 可选绑定来判断可选类型是否包含了值 如果包含就把值赋给一个常量或者变量 一般使用if或者while语句中 动态绑定也是一种解包方式
 在可选类型中存在 guard let guard let 和 if let 刚好相反 guard let 一定会有值的存在 如果没有，直接返回
 */
let optionValue7: String? = "1"

//比较少的使用 逻辑成立都是在if语句内部
if let temp = optionValue7
{
   print(temp)
    
}else
{
    print("temp not value")
}

let optionValue8: String? = nil
let optionValue9: String? = "12"

//可以得出结论:两个可选类型同时使用动态绑定时 必须全部存在这回成立
if let temp = optionValue8, let temp1 = optionValue9
{
    print(temp,temp1)
}else
{
    print("temp not value")
}
/* 非可选类型不存在可选绑定
let optionValue9: String = "2"
if let temp = optionValue9{
    print(temp)
}
 */
// guard let  推荐使用 逻辑不存了存在else 内部  逻辑数据可以存在外部处理
func optionValue()
{
    guard let value = optionValue9 else
    {
        print("value 不存在值")
        return
    }
    print("value 存在值\(value)")
}

// 总结: ?:1 用于声明Optional变量  2 用在Optional值操作中,用来判断是否响应后面的
//      !:1 强制对 可选量 进行解包  2.声明 隐式解包的可选类型的时候, 一般用于类中的属性


/*
 2.1
 1.is:类型检查操作符 检查一个实例是否特定类的子类 如果是返回true 否则返回false
 2.条件:is操作符的左边必须是一个父类实例对象(或者子类的示例对象) 右边必须为子类实例对象
*/

class Father {}
class son1: Father{}
class son2: Father{}

let father: Father = Father.init()
let son_1: son1 = son1.init()
let son_2: son2 = son2.init()

let familyArray:[Any] = [father,son_1,son_2]

for i in 0..<familyArray.count
{
    let familyType = familyArray[i]
    
     if(familyType is son1)
    {
        print("son1类型")
        
    }else if(familyType is son2)
    {
        print("son2类型")
        
    }else if (familyType is Father)
    {
        print("是父类\n")
    }
}
/*
 2.2
 */
let array:[Any] = ["1",2,"3","4",5,6]
var stringCount: Int = 0
var intCount: Int = 0

for item in array
{
    if (item is String)
    {
       stringCount += 1
    }else
    {
        intCount += 1
    }
}

//非可选类型不能为nil 可以为空 可选类型可以为nil也可以为空
let stringName:String = ""
/*
 2.3 这种明确类型的类型判断会warning
 */
if (stringName is String)
{
    print("string class")
}else
{
    print("is not string class")
}

/*
 as as! as? 对象类型转换(String Aarry 为明确的系统结构体类型是不能转换 一般用于父类与子类之间的转化)
 3.1  as的使用 子类向父类转化
*/
//字面量无数据类型 数值类型的转换
let doubleValue = 45 as Double

class Dog {}
class Animal {}
class Car: Animal {}
let car: Car = Car.init()
//从派生类向父类的转换
let animal: Animal = car as Animal

/*
 3.2 as!: 转化类型 如果对于类型转换确定能转换成功请使用as!进行类型转化 不成功会报runtime错误 只用在确定向下转型一定能够成功的情况下，当试图将实例向下转为一个不正确的类型时，会抛出异常 向下转化类型(父类->子类)
 */
let car_1 = animal as! Car

//转化失败抛出错误
//let car_1_1 = animal as! Dog

/*
 3.3 as?: 转化类型 当不确定类型转化是否能成功请使用as? 使用as?如果转化失败会返回nil
 as? 在类型转化成功时候返回一个可选类型的对象 改值为可选类型的子类实例 需要解包使用 向下转化类型(父类->子类)
 */
//返回为可选类型对象
let car_2 = animal as? Car

if car_2 != nil
{
   print("car_2 不为nil")
}else
{
   print("car_2 为nil")
}

//转化不正确类型 不会奔溃 赋值nil
let car_2_2 = animal as? Dog

if car_2_2 != nil
{
    print("car_2 不为nil")
}else
{
    print("car_2 为nil")
}



