//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 构造过程
 */
//构造过程是使用类、结构体、枚举实例类型之前的准备工作 在新的实例可用前必须先执行此过程 设置实例中每个存储属性的初始值和其他任务的初始工作和必须的设置
//通过定义构造器来实现构造过程 这些构造器可以看作是用来创建特殊的类型新实例的特殊方法、swift中的构造过程无返回值、他们主要的任务是保证新实例在第一次使用前完成初始化
//类的实例也可以通过定义析构器在实例释放前执行特定的清楚工作

/*
 1 存储属性的初始赋值
 */
//类和结构体在创建实例的时候 必须为存储属性设置初始值 存储属性的值不能处于一个未知的状态 可以在构造器中为存储属性赋初始值、也可以在定义的过程中设置默认值
//注:当你为存储属性设置默认值或者在构造器中为其赋初始值 它们的值都是直接被设置的 不会触发任何的属性观察者

//1.1 构造器:构造器在创建某个特定类型的新实例时被调用 最简单的形式就是类似于不带任何参数的实例方法、关键字init命名
/*
init(){
    //执行构造过程
}
*/

struct Fatherheit{
    
    var temperature: Double
}
//枚举类型的逐一构造器方法(默认的构造器)
let heit = Fatherheit(temperature: 20.0)
print("fatherheit temperature is \(heit.temperature)")

//可以使用构造器设置存储属性的初始值 或者直接使用结构体自带的逐一构造器方法 在创建结构体实例时候赋初始值
struct FatherHeit{
    
    var wendu: Double
    //可以在构造器中的构造过程中设置属性的初始值
    init() {
        wendu = 20.1
    }
}
let weduinstance = FatherHeit()
print("温度值是\(weduinstance.wendu)")

//1.2 默认属性值:如果一个属性总是使用相同的初始值，那么为其设置一个默认值比每次都在构造器中赋值要好 使用默认值让属性的初始化和声明结合得更紧密 使用默认值能让你的构造器更简洁、更清晰，且能通过默认值自动推导出属性的类型 也能让你充分利用默认构造器、构造器继承等特性

struct Defaults{
    
    var defults = 10
}

let defa = Defaults()
print(defa.defults)


/*
 2 自定义构造过程
 */
//通过输入参数和可选类型的属性来自定义构造过程 也可以在构造过程中修改常量属性
//2.1 构造参数:在自定义构造过程时 可以在定义中提供构造参数 指定需要的值类型和名称 构造参数和语法跟函数的参数和语法相同
struct Celsius{
    
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        
         temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        
        temperatureInCelsius = kelvin - 273.15
    }
}

let class1 = Celsius(fromFahrenheit: 100.0)
print(class1.temperatureInCelsius)


let class2 = Celsius(fromKelvin: 200.0)
print(class2.temperatureInCelsius)

//2.2 参数的内部名称和外部名称
//跟函数和方法的参数一样 构造参数也拥有一个构造器外部的名称和构造器内部的名称 并不想函数和方法那样在参数前面存在一个方法名称(构成器主要是init()) 主要是通过参数的名称和参数的类型来确定调用的是哪个构造器方法 正因为参数的重要性 如果你在构成过程中没有提供外部的参数名称 swift会为参数生成一个内部相同的参数名称

struct Color{
    
    let red,green,blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 1.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// let veryGreen = Color(0.0, 1.0, 0.0) 报编译时错误，需要外部名称

//注:如果不通过外部参数名称传值 你是无法调用这个构造器的 只要构造器定义了某个外部参数名，你就必须使用它，忽略它将导致编译错误

//2.3 不带外部名的构造器参数
//如果你不希望为构造器的某个参数提供外部名字，你可以使用下划线(_)来显式描述它的外部名

struct Celsius1{
    
    var temperatureInCelsius: Double

    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}

let celsius = Celsius1(20.0)
print(celsius.temperatureInCelsius)


//2.4 可选属性类型
//如果你定制的类型包含一个逻辑上允许取值为空的存储型属性 无论是因为它无法在初始化赋值还是因为在之后的某个时间点可以赋值为空 你都需要将它设置为可选类型 可选类型的属性自动初始化为nil 表示这个值在初始化时候有意设置为空
class SurveyQuestion {
    
    var text: String
    //自动初始化为nil 不需要添加设置默认值或者初始值
    var response: String?
    
    init(text: String) {
        
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

if let value = cheeseQuestion.response {
    print(value)
}

//2.5 构造过程中常量属性的修改
//你可以在构造过程中的任意时间点给常量属性指定一个值 只要在构造过程结束是一个确定值、一旦常量属性被赋值 它将永远不能改变
//注意:对于类的实例来说 只能在它的类的构造过程中修改、不能在子类中修改


class SurveyQuestion1 {
    
    //定义的常量属性
    let text: String
    
    var response: String?
    
    init(text: String) {
        
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetstion = SurveyQuestion1(text: "How about beets?")
beetstion.ask()
// 打印 "How about beets?"
beetstion.response = "I also like beets. (But not with cheese.)"


/*
 3 默认的构造器
 */
//3.1 如果类和结构体内部的属性都有默认值 同时没有自定义的构造器 那么swift会给这样的类提供一个默认的构造器 这个默认的构造器简单的创建一个都有属性值都设置为默认值的实例

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

//3.2 结构体则默认的构造器为逐一构造器 如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储型属性没有默认值

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)


/*
 4 值类型的构造器代理
 */
//构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复

//1 构造器代理的实现规则和形式在值类型和类类型中有所不同 值类型不支持继承 “只能代理给自己的其他构造器“ 类则不同，它可以继承自其它类 这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化
//2 如果你为某个值类型定义了一个自定义的构造器，你将无法访问到默认构造器 结构体中将无法访问逐一成员构造器 防止你为值类型增加了一个额外的且十分复杂的构造器之后,仍然有人错误的使用自动生成的构造
//3 对于值类型，你可以使用self.init在自定义的构造器中引用相同类型中的其它构造器 并且你只能在构造器内部调用self.init 调用自己内部的构造器方法


//注意:假如你希望默认构造器、逐一成员构造器以及你自己的自定义构造器都能用来创建实例，可以将自定义的构造器写到扩展（extension）中，而不是写在值类型的原始定义中
struct Size1{
    
    var width = 0.0, height = 0.0
}

struct Point{
    
    var x = 0.0, y = 0.0
}

struct Rect{
    
    var origin = Point()
    var size = Size1()
    
    init() {}
    
    init(origin: Point, size: Size1) {
        
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size1) {
        
        let originX = center.x - (size.width / 2)
        
        let originY = center.y - (size.height / 2)
        //构造器代理
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

/*
 5 类的继承和构造过程
 */
//类里面的所有存储型属性 包括全部继承自父类的属性 都必须在构造过程中设置初始值
//Swift 为类类型提供了两种构造器来确保实例中所有存储型属性都能获得初始值，它们分别是指定构造器和便利构造器

//5.1 指定构造器:指定构造器是类中最主要的构造器 指定构造器将初始化类中提供的所有属性 并根据父类链往上调用父类的构造器来实现父类的初始化
/*
 重点:
 1 每一个类都必须拥有至少一个指定构造器 许多类通过继承了父类中的指定构造器而满足了这个条件
 2 便利构造器是类中比较次要的、辅助型的构造器
 3 你可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。
 4 可以定义便利构造器来创建一个特殊用途或特定输入值的实例
 5 只在必要的时候为类提供便利构造器，比方说某种情况下通过使用便利构造器来快捷调用某个指定构造器
*/

//5.2 指定构造器和便利构造器的语法
//指定构造器的写法跟值类型简单构造器一样
/*
init(parameters) {
    statements
}
 
便利构造器也采用相同样式的写法，但需要在init关键字之前放置convenience关键字
convenience init(parameters) {
    statements
}
*/

//5.3 类的构造器代理规则
/*
 为了简化指定构造器和便利构造器之间的调用关系，Swift 采用以下三条规则来限制构造器之间的代理调用
 1:指定构造器必须调用其直接父类的的指定构造器
 2:便利构造器必须调用同类中定义的其它构造器。
 3:便利构造器必须最终导致一个指定构造器被调用
 
 口诀:
 指定构造器必须总是向上代理
 便利构造器必须总是横向代理

 */

//5.4 两断式的构造过程
/*Swift 中类的构造过程包含两个阶段 1 第一个阶段，每个存储型属性被引入它们的类指定一个初始值 当每个存储型属性的初始值被确定后 2 第二阶段开始，它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性
两段式构造过程可以防止属性值在初始化之前被访问，也可以防止属性被另外一个构造器意外地赋予不同的值
 
 Swift 的两段式构造过程跟 Objective-C 中的构造过程类似。最主要的区别在于阶段 1，Objective-C 给每一个属性赋值0或空值（比如说0或nil）
 Swift 的构造流程则更加灵活，它允许你设置定制的初始值，并自如应对某些属性不能以0或nil作为合法默认值的情况
 
 swift编译安全检查:
 1 “指定构造器”必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器
 2 “指定构造器”必须先向上代理调用父类构造器，然后再为继承的属性设置新值。如果没这么做，指定构造器赋予的新值将被父类中的构造器所覆盖
 3 “便利构造器”必须先代理调用同一类中的其它构造器，然后再为任意属性赋新值。如果没这么做，便利构造器赋予的新值将被同一类中其它指定构造器所覆盖
 4 构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值
 
 
 阶段 1
 
 某个指定构造器或便利构造器被调用。
 完成新实例内存的分配，但此时内存还没有被初始化。
 指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化。
 指定构造器将调用父类的构造器，完成父类属性的初始化。
 这个调用父类构造器的过程沿着构造器链一直往上执行，直到到达构造器链的最顶部。
 当到达了构造器链最顶部，且已确保所有实例包含的存储型属性都已经赋值，这个实例的内存被认为已经完全初始化。此时阶段 1 完成。
 
 阶段 2
 
 从顶部构造器链一直往下，每个构造器链中类的指定构造器都有机会进一步定制实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
 最终，任意构造器链中的便利构造器可以有机会定制实例和使用self
 
*/

/*
  5.5 构成器的继承和重写
 */
//swift中的子类默认情况下不会继承父类的构造器。Swift 的这种机制可以防止一个父类的简单构造器被一个更精细的子类继承，并被错误地用来创建子类的实例 但是(父类的构造器仅会在安全和适当的情况下被继承)
//当你重写一个父类的指定构造器时，你总是需要写override修饰符，即使你的子类将父类的指定构造器重写为了便利构造器
/*
 指定构造器:编写和父类的指定构造器相匹配的子类构造器 你实际上是在重写父类的这个指定构造器 必须在定义子类构造器时带上override修饰符。即使你重写的是系统自动提供的默认构造器，也需要带上override修饰符
 便利构造器:编写了一个和父类便利构造器相匹配的子类构造器 由于子类不能直接调用父类的便利构造器 在子类中“重写”一个父类便利构造器时，不需要加override前缀
 */

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}


class Bicycle: Vehicle {
    //指定构造器 必须添加overrid前缀 表示重写父类指定构造器
    override init() {
        //如果自己类中存储属性 必须先赋值 然后调用父类的构造器 再赋值父类属性
        super.init() //注意:如果继承来的父类中的指定构造器 那必须调用父类构造器
        numberOfWheels = 2
    }
}
//子类可以在初始化时修改继承来的变量属性，但是不能修改继承来的常量属性


/*
 5.6 构造器的自动继承
 子类在默认情况下不会继承父类的构造器 但是如果满足特定条件，父类构造器是可以被自动继承的
 规则 1: 如果子类没有定义任何"指定构造器"，它将自动继承所有父类的指定构造器和便利构造器。
 规则 2: 如果子类提供了所有父类"指定构造器"的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承所有父类的"便利构造器"。
 */
class Animal{
    
    var paramater1: String
    //自定义指定构造器
    init(paramter: String) {
        
        self.paramater1 = paramter
    }
    //自定义便利构造器
    convenience init(conveienceParamter: String) {
        
        self.init(paramter:conveienceParamter)
    }
}

class Dog:Animal{
    
    var dog: String?
}
//如果子类没有定义定义任何指定构造器 那自动继承父类的指定构造器
let dogClass = Dog(paramter: "dogClass")
print(dogClass.paramater1)
//如果子类没有定义定义任何指定构造器 那自动继承父类的便利构造器
let dogClass2 = Dog(conveienceParamter: "dogClass2")



class Pig:Animal{
    
    //重写方法1:
    override init(paramter PigParamter: String) {

        super.init(paramter: PigParamter)
    }
    
    /*
     重新方法2:
     如果将父类的指定构造器在子类中重写重变量构造器 依旧是实现了全部的父类指定构造器(会继承父类的便利构造器)
     init(pigParater: String) {
        
        super.init(paramter: pigParater)
    }
    //将父类的指定构造器写成便利构造器
    override convenience init(paramter: String) {
        
        self.init(paramter: paramter)
    }
   */
}
//如果子类实现父类所有的指定构造器 那将继承父类全部的便利构造器
let pigClass = Pig(conveienceParamter: "pigClass")
print(pigClass.paramater1)



/*
 5.7 自定构造器和便利构造器的实践(枚举和结构体有默认构造器 类没有默认构造器)
 */
class Food{

    var name: String
    //指定构造器 必须保证它所在引入的初始值都必须先初始话完成 之后才能将其它构造任务向上代理给父类中的构造器
    init(name: String) {
        //super.init() 本身是基类
        self.name = name
    }
    //便利构造器
    convenience init() {
        //横向指向 指定构造器(构造器代理)
        self.init(name: "[Unnamed]")
    }
}

//调用指定构造器
let namedMeat = Food(name: "Bacon")
print(namedMeat.name)
//调用变量构造器
let mysteryMeat = Food()
print(mysteryMeat.name)


class RecipeIngredient: Food {
    
    var quantity: Int
    //重点:如果子类实现指定构造器方法(不管参数与父类是否对得上 必须调用父类指定构造器 当参数的类型和参数标签和参数名称和父类的一致时 swift默认则是重写父类的指定构造方法 需要在init关键字前面添加overrid关键字 其他的则自己重新指定构造器 但需要调用父类的super.init())
    init(name: String, quantity: Int) {
         //先赋值自身的属性 然后调用父类的构造器 再然后给父类的属性赋值
        self.quantity = quantity
        super.init(name: name)
    }
    //子类可以将父类的指定构造器重写成变量构造器 必须再构造方法前面添加override(使用了跟父类指定构造器相同的参数)
    //将父类的指定构造器在子类如果写成便利构造器:将便利构造器的参数写成跟父类指定构造器参数一致
    override convenience init(name: String) {
        //便利构造器横向代理 调用类本身的其他便利构造器
        //self.init(name: name, quantity: 1)
        self.init()
    }
    //自定义便利构造器(带参数的构造器)
     convenience init(name1: String) {
         //便利构造器横向代理
        self.init(name: name1, quantity: 1)
    }
    //在类中:子类是不能直接调用父类的便利构造器的 所以你如果子类中写一个和父类便利构造器相匹配的便利构造器(相同的参数) 你的子类并未对父类的便利构造进行重写 所以无需添加override关键字
    convenience init() {
         //便利构造器横向代理
        self.init(name: "ni", quantity: 1)
    }
}

/*
 6 可失败构造器
 */
//如果类、结构体、枚举类型的对象在构造过程中出现失败 则为其定义一个可失败的构造器 这里的失败指的是:构造器传入无效的值、或者缺少某种搜需要的外部资源、或者是不能满足某种必要的条件
//可以在类、结构体、枚举中添加一个或者多个失败构造器、在init的后面添加？(init?) 可失败构造器会创建一个类型为自身类型的可选类型对象、你可以通过return nil来表示失败构造器构造失败(你只能用return nil来表示构造器可能构造失败 不能用return 来表示构造过程的返回值)
//注意:可失败构造器的参数类型和参数名 不能同非可失败的参数和参数名相同
//Int类型的转换(可选类型)
let number: Double = 1234.0
let pi = 3.14159

let valueMaintained = Int(exactly: number)
let valueChange = Int(exactly: pi)


struct Person{
    
    let species: String
    //可失败构造器(返回的是一个可选类型的Person对象 不是Person对象)
    init?(species: String) {
        
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
//可失败构造器构造的对象返回的是可选类型对象
let somePerson = Person(species: "Tom")
//可选绑定
if let person = somePerson  {
    print(person.species)
}

let failurePerson = Person(species: "")
if failurePerson == nil {
    print("init is failure")
}

/*
  6.1 枚举类型的可失败构造器
 */
//你可以通过一个带多个参数或者一个参数的可失败的构造器来获取枚举类型对应的枚举成员值、如果参数没有匹配任何的成员 则构造失败

enum TemperatureUnit{
    //定义三个枚举成员的枚举
    case Kevein,Tom,Jack
    //构造器带参数匹配枚举成员
    init?(symbol: Character){
        switch symbol {
        case "K":
            self = TemperatureUnit.Kevein
        case "T":
            self = TemperatureUnit.Tom
        case "J":
            self = TemperatureUnit.Jack
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
//构造失败
let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

/*
 6.2 带原始值的枚举类型的可失败构造器
 */
//带原始值的枚举类型会自带一个可失败构造器init?(rawValue:) 该可失败构造器有名为rawValue的参数 其类型和枚举类型原始值一致 如果该参数的值可以和枚举原始值匹配 则构造器会构造相应的成员 否则构造失败
enum Temperature: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheit = Temperature(rawValue: "F")
if fahrenheit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}


let unknown = Temperature(rawValue: "X")
if unknown == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

/*
 6.3 构造失败的传递
 */
//类，结构体，枚举的"可失败构造器"可以横向代理到类型中的其他"可失败构造器"。类似的，"子类的可失败构造器也能向上代理到父类的可失败构造器"
//不管你横向代理还是向上代理到父类的可失败构造器 一旦其中有一个构造失败 则构造过程立刻停止 接下来的任何构造代码都不会执行
//注意:"可失败构造器"也可以代理到其它的"非可失败构造器"。通过这种方式，你可以增加一个可能的失败状态到现有的构造过程中

class Product {
    let name: String
    //父类的可失败构造器判断name
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    //子类可失败构造器判断quantity值
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        //子类大的可失败构造器代理到父类的可失败构造器
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

//子类中构造失败
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

//父类中构造失败
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}


/*
  6.4 重写一个可失败构造器
 */
/*重写可失败构造器:
 1 你可以在子类中重写父类的可失败构造器
 2 你也可以用子类的非可失败构造器重写一个父类的可失败构造器(这使你可以定义一个不会构造失败的子类，即使父类的构造器允许构造失败)
 注意:1 当你用子类的“非可失败构造器”重写(如何重写:使用解包调用父类的可失败构造器 其实就是重写父类的可失败构造器)父类的可失败构造器时，向上代理到父类的可失败构造器的唯一方式是对父类的可失败构造器的返回值进行强制解包(你可以用非可失败构造器重写可失败构造器，但反过来却不行)
    2 可以在子类的“非可失败构造器”中使用“强制解包”来“调用”父类的“可失败构造器”
*/

class Document {
    var name: String?
    // 该构造器创建了一个 name 属性的值为 nil 的 document 实例
    init() {}
    // 该构造器创建了一个 name 属性的值为非空字符串的 document 实例
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}
//方法一
class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    //子类中用非可失败的构造器重写父类的可失败构造器(参数类型跟父类一样)
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    /*
     重写父类的可失败构造器
    override init?(name: String) {
    }
    */
    //在子类中不管你是自定义的非可失败构造器还是重写父类的非可是构造器 你是可以调用父类的可失败构造器的
    override init() {
        super.init(name: "[Untitled]")!
    }
}

/*
 6.5 可失败构造器 init!
 */
//们通过在init关键字后添加问号的方式（init?）来定义一个可失败构造器 也可以通过在init后面添加惊叹号的方式来定义一个可失败构造器（init!） 该可失败构造器将会构建一个对应类型的隐式解包可选类型的对象
/*
 init? 可以代理到 init！    init！可以代理到 init？
 
 init？可以重写到 init！   init！可以重写到 init？
 
 init 可以重写到 init！
 
 一旦init!构造失败，则会触发一个断言
 
 */

/*
  7 必要的构造器
 */
//在类的构造器前添加required修饰符表明所有该类的子类都必须实现该构造器

class SomeClass {
    required init() {
        // 构造器的实现代码
    }
}

/*
 1 在子类重写父类的必要构造器时，必须在子类的构造器前也添加required修饰符，表明该构造器要求也应用于继承链后面的子类
 2 在重写父类中必要的指定构造器时，不需要添加override修饰符(如果没有指定必要 重写父类构造器需要添加override)
*/

class SomeSubclass: SomeClass {
    required init() {
        // 构造器的实现代码
    }
}
//注意:如果子类继承的构造器能"满足必要构造器"的要求，则无须在子类中"显式提供必要构造器的实现"


/*
  8 通过闭包或者函数设置属性的默认值
 
  如果某个存储型属性的默认值需要一些定制或设置，你可以使用闭包或全局函数为其提供定制的默认值 每当某个属性所在类型的新实例被创建时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性
 */

class SomeClassType {
    let someProperty: String = {
        // 在这个闭包中给 someProperty 创建一个默认值
        // someValue 必须和 SomeType 类型相同
        return "type"
        //闭包执行的时候 其他部分都还没有初始化 你不能在闭包内部访问self 其他属性 其他方法
    }()
}
/*注意:
 1 闭包结尾的大括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性
 2 如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其它部分都还没有初始化。这意味着你不能在闭包里访问其它属性，即使这些属性有默认值
 */

struct Checkerboard {
    //初始化的时候就开始执行闭包赋值(闭包给数组赋值)
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Checkerboard()
print(board.squareIsBlackAtRow(row: 0, column: 1))
print(board.squareIsBlackAtRow(row: 7, column: 7))











