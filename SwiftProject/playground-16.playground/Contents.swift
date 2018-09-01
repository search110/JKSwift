//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 下标
 */
//下标定义:定义在类、结构体、枚举中 是访问集合、列表、序列元素的快捷键 一个类型可以定义多个下标 通过不同的索引类型重载 你可以定义多个入参的下标来满足自定义类型的需求
//下标的作用:使用下标类设置和获取值 而不需要调用对应的存取方法
//下标语法:下标允许在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取 语法类似实例方法和计算类型属性语法的混合 使用关键字subscript定义下标语法 下标语法设置的值可以是读写和只读

struct sub{
    
    subscript(index: Int) -> Int {
        get {
            // 返回一个适当的 Int 类型的值
            return 1
        }
        set(newValue) { //如果不指定set的参数名称 则默认newValue  newValue 的类型和返回类型一致
            // 执行适当的赋值操作
        }
    }
}

struct TimesTable {
    
    let multiplier: Int
    //下标只读
    subscript(index: Int) -> Int {
        
        return multiplier * index
    }
}

let timetable = TimesTable(multiplier: 3)
//通过下标获取值还或者设置值 下标的使用类似于数组取值
print(timetable[2])

//下标的用法:下标通常作为访问集合，列表或序列中元素的快捷方式


var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
//添加字典值
numberOfLegs["bird"] = 2
print(numberOfLegs)

let value = numberOfLegs["ant"]

if let value1 = numberOfLegs["cat"] {
    
    print(value1)
}


//下标的选项:下标可以接受任意数量的入参 并且这些入参可以是任意类型 下标返回值也可以是任意类型 下标可以使用变量参数、可变参数、不能是输入输出参数 也不能给参数设置默认值
//下标的重载:一个类或者结构体提供多个下标实现 使用的下标的时候使用入参的数量和类型进行区别 自动匹配合适的下标


struct Matrix {
    
    let rows: Int, columns: Int
    
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        
        self.rows = rows
        
        self.columns = columns
        
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    // 断言 判断输入的row和columns是否超出范围
    func indexIsValid(row: Int, column: Int) -> Bool {
        
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    //下标
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}


var matrix = Matrix(rows: 2, columns: 2)

//取值
print(matrix[0, 1])
//设置
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

print(matrix[0,1])















