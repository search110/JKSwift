//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//本节是swift中的重点
/*
  ***** 协议 *****
 */
// 1 协议规定了实现某一特定任务或者功能的方法、属性、以及其他需要的东西。类、结构体、枚举都可以遵循协议、并且实现协议提供的具体的某种功能、如果某个类型满足协议的要求、可以说这个类型遵循这个协议
//  2 除了遵循协议的必要方法功能必须实现外、还可以对协议进行扩展、通过扩展可以实现一部分要求功能或者实现一些附加的功能、这样就可以扩展遵循协议的类型丰富的功能

/*
  1 协议的语法
 */
protocol SomeProtocol {
    // 这里是协议的定义部分
}
protocol SomeSencodProtocol{
}

//遵循协议:需要在类型名称后加上协议名称、中间以:分隔、遵循多个协议时、各协议之间使用逗号(,)分隔
struct SomeStruct:SomeProtocol,SomeSencodProtocol{

}

//在类类型中:拥有父类的类在遵循协议的时候、应该将父类名放在协议名之前、以逗号(,)分隔
class SomeSuperClass:SomeProtocol{

}
//继承父类时候、当父类已经遵循某些协议的时候、子类可以直接使用、如果子类再次遵循会报重复错误
class SomeClass:SomeSuperClass,SomeSencodProtocol{
}


/*
  2 属性要求
 */
/* 1 协议可以要求遵循协议的类型提供特定"名称"和"类型"的实例属性和类型属性(遵循协议就必须要实现协议定义的特定属性)
   2 协议定义的属性不指定是“计算型属性”还是“存储属性”、它只指定属性的类型和名称(协议定义了类需要实现的属性名称和类型)
   3 协议定义的属性只指定属性是“可读的”还是“可读可写的” 不指定属性的种类类型
 
 1 如果协议要求属性是可读可写的、那么该属性不能使“常量属性”或者“只读的计算型属性”、
 2 如果协议只要求属性是可读的、那么该属性不仅可以定义为只读的、如果代码需要的话、还可以是可写的

 特点:协议声明的“变量属性”使用关键字var来定义(可写的必须使用var关键字、可读的属性可使用关键let来定义)、在类型的声明后面添加{set、get}来表示属性的可读可写、使用{get}来表明属性是可读的
 */
protocol SomeProtocol1{
    //可读可写属性
    var mustBeSettable: Int{set get}
    //可读属性
    var doesNotNeedToBeSettable: Int {get}
}

//在协议中定义“类型属性”的时候、总是使用static关键字作为前缀(可以是值类型和类类型)、当类类型属性遵循协议的时候还可以使用关键字class类声明类型属性
protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
}

protocol FullyNamed {
    var fullName: String {get}
    var bigName:String {get}
    var changeName: String {set get}
}

struct Person: FullyNamed{
    //不仅可以写成可读 还可以可写(符合协议定义)
    var fullName: String
    var changeName: String
    //只能可读 符合协议定义
    var bigName: String{
        return "bigName"
    }
}
var john = Person(fullName: "nihao", changeName: "dajiahao")
print(john.fullName,john.changeName,john.bigName)
//协议定义的fullName可读的 fullName可以不仅是可读还可以是可写
john.fullName = "nihaoagain"
john.changeName = "woyehao"
//john.bigName ="你好" 根据协议的要求 在类型中实现为只读 数据返回  不能修改
print(john.fullName,john.changeName)


/*
 3 方法要求
 */
/*
  1 协议可以要求遵循协议的类型实现某些指定的实例方法或类型方法、这些方法作为协议的一部分、像普通的方法一样放在协议的定义中
  2 协议定义的方法不需要大括号和方法体
  3 可以在方法中定义可变参数的方法
  4 不支持为协议中的方法的参数提供默认值
 */
//协议中定义的类方法使用static定义、当类类型遵循协议的时候可以使用calss关键字类作为前缀
protocol ProtocolName1{
    //类型方法
    static func protocolName1()
}

protocol ProtocolName2{
    //实例方法
     func protocolName2()->Double
}

class LinearCongruentialGenerator:ProtocolName2{
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func protocolName2() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
//默认构造器
let generator = LinearCongruentialGenerator()

print("Here's a random number: \(generator.protocolName2())")
print("And another one: \(generator.protocolName2())")



/*
 4 Mutating 方法要求
 */
/*
  1 有时候在方法中改变方法所属的实例、在类型的实例方法中、将mutating关键字作为实例方法的前缀 写在func关键字前面、表示在改方法中修改它所属的实例和实例属性的任意值
  2 在协议中定义一个实例方法、该方法会改变遵循该协议的类型中的属性、那么在定义方法的时候就需要在方法前面添加关键字mutating关键字、如果是类类型则不要添加关键字
 */

protocol Togglable {
    //将会在遵循协议的方法类型中修改类型的属性值 需要添加mutating关键字
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    
    case off, on
    
    mutating func toggle() {
        
        switch self {
            
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()


/*
 5 构造器的要求
 */
/*
  1 协议可以要求遵循协议的类型实现指定的构造器、你可以像编写普通的构造器那样、在协议的定义里写下构造器的声明
  2 不需要写构造器的花括号和构造器的实体
 */
protocol ProtocolName3{
    init(someParamter: Int)
}
//5.1 构造器在类类型中的实现
// 1 你可以在遵循协议的类中实现构造器、无论是“指定构造器”还是“便利构造器” 无论哪一种构造器你都必须为构造器实现标上required修饰符 当子类继续的时候必须实现这个构造器(符合协议的要求)
// 2 如果类已经被标记为final(不可继承)，那么不需要在“协议构造器”的实现中使用“required”修饰符，因为“final”类不能有子类
class Father: ProtocolName3{
    //使用required 确保所有的子类也必须提供此构造器的实现、符合协议要求
    required init(someParamter: Int) {
    }
}
//因为final修改的类 不能被继承
final class Big:ProtocolName3{
    //可以不添加required关键字
    init(someParamter: Int) {
    }
}

//父类遵循了协议 子类就不能再次遵循 否则会报错
class teacher{
    init(someParamter: Int) {
    }
}

class Son:teacher,ProtocolName3{
    // 因为遵循协议，需要加上 required 因为继承自父类，需要加上 override
    required override init(someParamter: Int) {
        // 这里是构造器的实现部分
        super.init(someParamter: 1)
    }
}

//如果子类没有遵循协议 父类指定了必要构造器 子类必须实现必要构造器 且不需要添加加overrid关键字
class mother{
    required init(name: String) {
    }
}

class subclass:mother{
    //子类重写父类的构造器 可以不添加override关键字
    required init(name: String) {
        super.init(name: name)
    }
}

//5.2 协议定义可失败构造器:协议可以为遵循协议的类定义可失败构造器
protocol ProtocolName4{
    //可失败构造器
    init?(failure: String)
}
//协议构造器如果用在类类型中必须使用required 保证子类可以继承
class dog:ProtocolName4{
    
    required init?(failure: String) {
    }
}
//协议构造器如果用在值类型中 则不需要使用required关键字
struct fialureStruct:ProtocolName4{
    
    init?(failure: String) {
        
    }
}


/*
  6 协议作为类型使用
 */
/*
   尽管协议本身并未实现任何功能，但是协议可以被当做一个成熟的类型来使用
   1 作为函数、方法或者构造器中的参数类型或返回值类型
   2 作为常量、变量或者属性的类型
   3作为数组、字典或者其他容器中的元素类型
 注意:协议是一种类型、因此协议类型的名称与其他类型的写法一致、使用大写字母开头的驼峰写法
 */
class Dice{
    
    let sides: Int
    let generator: ProtocolName2 //协议作为类型 ProtocolName2类型
    //任何遵循了协议ProtocolName2的类型的“实例”(遵循协议后的类型初始化的实例)都可以赋值给generator类型
    init(sides: Int, generator: ProtocolName2) {
        self.sides = sides
        self.generator = generator //属性值只能为遵循了该协议的任何类型的实例对象
    }
    
    func roll() -> Int {
        //使用generator作为属性调用ProtocolName2类型(协议)中的方法
        return Int(generator.protocolName2() * Double(sides)) + 1
    }
}
//generator 传入的是遵循了ProtocolName2协议的类型实例对象
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}


/*
  7 委托(代理)模式
 */
/*
 1 委托是一种设计模式、它允许类或者结构体将一些需要它们负责的功能委托给其他类型的实例去实现、
 2 委托模式的实现很简单 定义协议来封装那些需要被委托的功能、这样可以确保遵循协议的类型能提供这些功能
 3 委托模式可以用来响应特定的动作、或者接受外部数据源提供的数据、而无需关系外部数据源的类型
 */
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

//遵循DiceGame协议
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate? //DiceGameDelegate作为类型 可选值类型(任何遵循了DiceGameDelegate协议类型的实例)
    func play() {
        square = 0
        //可选链式调用 因为类型为DiceGame类型、而所有遵循了DiceGame协议的类型实例都可以作为参数传入、所有可以传入self
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

//遵循DiceGameDelegate 协议
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()


/*
  8 通过扩展添加协议
 */
/*
 1 在无法修改源代码中添加协议的情况下、依然可以“通过扩展使得已有的类型遵循并符合协议”
 2 扩展特点:可以为已有的类添加属性、方法、下标、以及构造器 这也符合协议中的相应要求(通过扩展添加协议)
 
 注意:通过“扩展”令已有的“类型遵循并符合协议时”、该类型的“所有实例”也会随之获得协议中定义的各项功能
 通过扩展遵循并符合协议、和在
 */
protocol TextRepresentable {
    var textualDescription: String { get }
}
//通过扩展使得 Dice 遵循TextRepresentable协议
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

















