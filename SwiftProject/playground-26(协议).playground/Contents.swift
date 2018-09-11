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

//在协议中定义“类型属性”的时候、总是使用static关键字作为前缀(可以是值类型和类类型)、当类类型遵循协议的时候还可以使用关键字class类声明类型属性
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

//如果子类没有遵循协议(或者协议不存在构造器) 父类指定了必要构造器 子类必须实现必要构造器 且不需要添加加overrid关键字 添加required关键字
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
//协议定义的构造器如果用在类类型中必须使用required 保证子类可以继承
class dog:ProtocolName4{
    
    required init?(failure: String) {
    }
}
//协议定义的构造器如果用在值类型中 则不需要使用required关键字
struct fialureStruct:ProtocolName4{
    
    init?(failure: String) {
    }
}


/*
  6 协议作为类型使用
 */
/*
   尽管协议本身并未实现任何功能(定义方法、属性、函数)，但是协议可以被当做一个成熟的类型来使用
   1 作为函数、方法或者构造器中的参数类型或返回值类型
   2 作为常量、变量或者属性的类型
   3 作为数组、字典或者其他容器中的元素类型
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
 通过扩展遵循并符合协议、和在原始代码中遵循协议的的效果相同、协议名写在类型名的后面、以冒号分隔开来、然后再扩展的大括号中实现协议的要求的内容
 */
protocol TextRepresentable {
    var textualDescription: String { get }
}
//通过扩展使得 Dice 遵循TextRepresentable协议(给Dice添加新的可读属性)
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}


/*
  9 通过扩展遵循协议
 */
/*
  当一个类型已经符合了某种协议的全部的所有要求、缺还没有声明遵循该协议、可以通过空扩展体的扩展来遵循该协议
 注意:即使满足了协议的所有要求，类型也不会自动遵循协议，必须显式地遵循协议
 */
struct Hamster{
    var name: String
    //Hanster类型已经遵循了TextRepresentable协议的内容
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
//通过空扩展体来遵循协议
extension Hamster:TextRepresentable{}

//任何遵循了协议类型的实例都可以作为协议类型来使用
let hamster = Hamster(name: "name")
let textRepresentable: TextRepresentable = hamster
print(textRepresentable.textualDescription)


/*
  10 协议类型的集合
 */
/*
  协议类型可以在数组或者字典这样的集合中使用
 */
// 任何遵循了该协议类型的实例都可以作为协议类型来使用
let things: [TextRepresentable] = [hamster,d6]

//thing是TextRepresentable类型 而不是对应的Hamster、Dice类型 即使实例在幕后确实是这些类型中的一种
for thing in things {
    print(thing.textualDescription)
}


/*
 11 协议的继承
 */
/*
  1 协议可以继承一个或者多个协议、可以在继承的协议的基础上增加新的要求
  2 协议的继承语法和类型继承语法类似、多个被继承的协议使用逗号分隔
 */
//InheritingProtocol协议继承SomeProtocol、AnotherProtocol协议
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // 这里是协议的定义部分
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}


extension SnakesAndLadders: PrettyTextRepresentable {
    
    var textualDescription: String {
         return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
    
    var prettyTextualDescription: String {
        //每个PrettyTextRepresentable类型同时也是TextRepresentable类型
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)

/*
 12 类类型专属协议
 */
/*
  你可以在协议的继承列表中、通过添加class关键字来限制协议只能被类类型遵循、而结构体和枚举类型不能遵循该协议、class关键字必须第一个出现在协议继承列表中、在其他的继承协议之前
 
 注意:当协议定义的要求需要遵循协议的类型必须是"引用语义"(类类型)而非“值语义”(值类型)时，应该采用类类型专属协议。关于引用语义和值语义的更多内容
 */
protocol someClassOnlyProtocol: class,InheritingProtocol{
    // 这里是类类型专属协议的定义部分
}
/*
struct someStructClass:someClassOnlyProtocol{
  //如果使用之类型遵循协议 就会报运行时错误
}
*/
class someOnlyClass:someClassOnlyProtocol{
   
    static var someTypeProperty: Int{
        set{
            
        }get{
          
            return 1
        }
    }
}


/*
  13 协议合成
 */
/*
  有时候需要同事遵循多个协议、你可以将多个协议采用SomeProtocol & AnotherProtocol这样的格式进行组合使用、称为协议合成、你可以罗列任意多个你想要遵循的协议，以与符号(&)分隔
 */

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
//遵循协议Named和Aged协议
struct PersonName: Named, Aged {
    var name: String
    var age: Int
}
//Named&Aged 两个协议组合成一个协议组合的类型
func wishHappyBirthday(to celebrator: Named&Aged) {
    
     print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = PersonName(name: "Malcolm", age: 21)
//任何遵循了Named&Aged协议的类型实例都可以作为Named&Aged类型 它不关心参数的类型、只要参数符合这两个协议即可
wishHappyBirthday(to: birthdayPerson)


//使用类型和协议进行组合
class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)

//beginConcert(in:)方法接受一个类型为 Location & Named 的参数，这意味着"任何Location的子类，并且遵循Named协议
// 任何的Location的子类和子类遵循了Named协议的实例都满足这两个条件即可


/*
  14 检查协议的一致性
 */
/*
  1 你可以使用is和as来检查协议的一致性、即是否符合某个协议、并且可以转换到某个协议类型
  2 检查和转换到某个协议类型在语法上和类型的检查和转换完全相同
 
 is 用来检查实例是否符合某个协议，若符合则返回 true，否则返回 false。
 as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil。
 as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。
 */

protocol HasArea {
    var area: Double { get }
}

//遵循协议
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

//未遵循协议
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects{
    var isYESCount: Int = 0
    var isNOTCount: Int = 0
    //使用is来判断实例是否遵循了协议
    if object is HasArea{
        
        isYESCount += 1
        
    }else{
        
       isNOTCount += 1
    }
}

for object in objects {
    
    //数字objects的元素类型依然是对应的类型Circle、Country、Animal类型、当它们被赋值给常量objectWithArea的时候被视为 HasArea类型 可以访问对应的协议定义的属性
    
    if let objectWithArea = object as? HasArea {

        print("Area is \(objectWithArea.area)")
        
    } else {
        
        print("Something that doesn't have an area")
    }
}

/*
 15 可选协议的要求
 */
/*
 协议可以定义为“可选协议”、遵循协议的类型可以选择是否实现这些要求.
 可选协议的要求:
  1 在协议中使用关键字optional关键字作为前缀来在方法、函数、属性之前、 “可选协议要求”用在你需要和 Objective-C 打交道的代码中
  2 “协议”和“可选协议的属性、方法、函数”都必须带上@objc属性关键字
  3 标记为@objc特性的协议只能被继承自Objective-C的类或者@objc类遵循 其他类以及结构体和枚举均不能遵循这种协议
 
 使用"可选要求"时（例如，可选的方法或者属性），它们的类型会自动变成可选的 需要注意的是整个函数类型是可选的，而不是函数的返回值
 */
@objc protocol CounterDataSource{
    //协议为可选协议 按道理遵循协议的类型可以选择实现是否实现协议里面的方法、属性 但是最好还是实现
    @objc optional func incrementForCount(count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    //CounterDataSource类型的可选属性
    var dataSource: CounterDataSource?
    func increment() {
        //使用可选链式调用
        if let amount = dataSource?.incrementForCount?(count: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

//1 标记为@objc特性的协议能被继承自Objective-C的类继承
class ThreeSource: NSObject,CounterDataSource{
    
     let fixedIncrement = 4
}
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

//2 标记为@objc特性的协议能被@objc类遵循(该类也必须继承自OC类对象)
@objc class FourSource: NSObject,CounterDataSource{
    
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
    
}

counter.count = -4
//作为属性类型
counter.dataSource = FourSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

/*
 16 协议的扩展
 */
/*
 协议可以通过“扩展”来为“遵循协议的类型”提供属性、方法、以及下标的实现。你可以基于协议本身来实现这些功能，而无需在每个遵循协议的类型中都重复同样的实现，也无需使用全局函数
 */

protocol RandomNumberGenerator{
    func random() -> Double
}

class currentClass:RandomNumberGenerator{
    func random() -> Double {
        return 1.0
    }
}

//通过扩展来增加协议的方法、所有遵循协议的类型实例都可以使用扩展增加的方法
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
//默认构造器
let curren = currentClass()
print(curren.randomBool())


/*
  17 提供默认实现
 */
/*
  可以通过协议扩展来为协议要求的属性、方法、函数以及下标提供默认的实现、如果遵循协议的类型为这些要求提供了自己的实现，那么这些自定义实现将会替代扩展中的默认实现被使用
 注:“通过extension扩展来为这个协议protocol中的属性或者方法提供默认的值”
 注意:通过协议扩展为协议里面定义的属性或者方法提供某人的值和可选协议要求不同点:
     1 虽然两者情况下、遵循协议的类型无需自己实现协议要求的方法、属性、或者其他功能
     2 但是通过扩展提供的协议默认实现可以直接调用、不需要使用可选式调用
 */

//给协议PrettyTextRepresentable中的属性prettyTextualDescription提供默认的属性值
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return "你好"
    }
}

/*
  18 为协议扩展添加限制条件
 */
/*
  在扩展协议的时候、可以指定一些限制条件、只有遵循协议的类型满足这些限制条件、才能获取协议扩展中提供的默认实现、这些限制条件写在协议名之后、使用 where 子句来描述
 */
//只适用于集合元素遵循了TextRepresentable协议的类型(Collection为协议、 where 写在扩展协议的后面 where后则写条件)
extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
//数组符合CollectonType协议、元素同时也符合TextRepresentable协议
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

print(hamsters.textualDescription)
//注意:如果多个协议扩展都为同一个协议提供了默认实现，而遵循协议的类型又同时满足这些协议扩展的限制条件，"那么将会使用"限制条件最多"的那个"协议扩展"作为提供的默认的实现"










