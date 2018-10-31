import UIKit

var str = "Hello, playground"
/**
 * 内存安全
 */
//swift是安全语言、它会阻止你代码中不安全的行为、比如swift保证变量在访问之前完成初始化、内存被回收后就无法访问了、swift也保证了在同一时间访问同一内存不会冲突、通过约束代码里对于存储地址的写操作、去获取那一块内存的独占权、swift是自己管理内存、所以在大部分你不需要自己去管理内存访问的问题、理解潜在的冲突也是很重要的、可以避免你写冲突代码、如果你的代码存在访问冲突、在编译和运行时候会出现错误提示
/*
 * 1 内存访问冲突
 */
//内存访问的冲突会发生在你的代码尝试同时访问同一个存储地址的时侯。同一个存储地址的多个访问同时发生会造成不可预计或不一致的行为。在 Swift 里，有很多修改值的行为都会持续好几行代码，在修改值的过程中进行访问是有可能发生的
/*
 * 1.1 内存访问的典型状况
 内存访问冲突存在着三种典型的状况:访问是读还是写、访问的时长、以及被访问的存储地址
 特别是你的访问冲突符合一下三种中的两种情况：1 至少有一个是写的访问 2 它们访问的是同一个内存地址 3 它们的访问在时间线上部分重叠
 */
//内存访问的时长要么是瞬时的要么是长期的两种情况
//下面是瞬时的访问
func oneMore(than number: Int) -> Int {
    return number + 1
}
var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)
//瞬时访问和长期访问的区别在于别的代码有没有可能在访问期间同时访问，也就是在时间线上的重叠。一个长期访问可以被别的长期访问或瞬时访问重叠
//重叠的访问主要出现在使用"in-out参数的函数和方法"或者"结构体的mutating方法里"
/*
 *2 In-Out参数的访问冲突
 */
//一个函数会对它所有的in-out参数进行长期的写访问、in-out参数的写访问会在所有的非in-out参数处理完毕后开始、知道函数运行完毕为止、如果有多个in-out参数、则写访问的顺序和参数的顺序一致
//长期的访问会造成一个结果、你不能在原变量以in-out形式传入后访问原变量(即在传入参数的内部访问以in-out传入的参数) 即使作用域原则和访问权限允许 —— 任何访问原变量的行为都会造成冲突
var stepSize = 1
func increment(_ number: inout Int) {
    number += stepSize
}
// 错误：stepSize 访问冲突
increment(&stepSize)
//解决办法:复制一份副本
//var copyOfStepSize = stepSize
//increment(&copyOfStepSize)

var setpsize = 2
func increment1(_ number: inout Int) {
    number += 4
}
increment1(&setpsize)
print(setpsize)
/*
 * 2.1 长期写访问的存在还会造成另一种结果，往同一个函数的多个 in-out 参数里传入同一个变量也会产生冲突
 */
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // 正常
//balance(&playerOneScore, &playerOneScore)
// 错误：playerOneScore 访问冲突
/**
 * 3 方法里的self的访问冲突
 */
//一个结构体的mutating方法会在调用期间对self进行写访问
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}
extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // 正常
//oscar.shareHealth(with: &oscar) // 错误：oscar 访问冲突

//mutating方法在调用期间需要对self发起写访问，而同时 in-out 参数也需要写访问。在方法里，self 和  teammate 都指向了同一个存储地址
/*
 * 3 属性的访问冲突
 */
//如结构体，元组和枚举的类型都是由多个独立的值组成的，例如结构体的属性或元组的元素。因为它们都是值类型，修改值的任何一部分都是对于整个值的修改，意味着其中一个属性的读或写访问都需要访问整一个值
//新版本可以对元祖的元素进行同时的访问(即使访问health和energy都是改变整体元祖的值)
var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, &playerInformation.energy)

//将实例对象定义为全局的存储变量也可以对结构属性的访问同事以in-out形式访问结构体的mutating方法
var holly = Player(name: "Holly", health: 10, energy: 10)
balance(&holly.health, &holly.energy)
/*
 你访问的是实例的存储属性，而不是计算属性或类的属性
 结构体是本地变量的值，而非全局变量
 结构体要么没有被闭包捕获，要么只被非逃逸闭包捕获了
 
 注意:这几种处理方式有待验证、因为新版本的改版
 */
