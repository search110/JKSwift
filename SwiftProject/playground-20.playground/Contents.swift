//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
  自动引用计数
 */
/*
 swift使用自动引用计数来管理应用程序的内存 swift的内存管理机制会一直起作用 你不需要自己来管理内存 ARC会在类的实例不使用的时候释放内存

 注意:引用计数仅仅是应用于类的实例 结构体和枚举都是值的类型 不是引用类型 也不是通过引用的方式传递和存储值(结构体、枚举是通过复制的方式来存储和传递值)
 
 */

/*
  1 自动引用计数的工作原理
  1.1: 当你每次创建一个类的新实例时候，ARC会分配一块内存来储存该实例信息。内存中会包含实例的类型信息，以及这个实例所有相关的存储型属性的值
  1.2: 当实例不再被使用时，ARC释放实例所占用的内存，并让释放的内存能挪作他用。这确保了不再被使用的实例，不会一直占用内存空间
  1.3: 当ARC收回和释放正在使用的类的实例对象时候  该实例的属性和方法将不能在被调用和访问 如果你试图访问这个实例 你程序可能将会奔溃
  1.4: 为了确保使用的实例不被销毁 ARC会跟踪计算每一个实例正在被多少个属性、常量、变量引用 哪怕引用计数值为1 实例都不会被释放
  1.5: 无论你将实例赋值给属性、常量或变量，它们都会创建此实例的强引用。之所以称之为“强”引用，是因为它会将实例牢牢地保持住，只要强引用还在，实例是不允许被销毁的
 */

/*
  2 自动引用计数的实践
 */
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var person1: Person?
var person2: Person?
var person3: Person?

//此时Person的引用计数值为1强引用
person1 = Person(name: "Tom")
//ARC值 2
person2 = person1
//ARC值 3
person3 = person1

//此时 释放Person的引用 但是Person的引用计数值还是1 deinit 不会调用 类实例不会释放
person1 = nil
person2 = nil

//释放实例对象 (deinit调用)
person3 = nil


/*
 3 类实例之间的循环强引用
   我们可能会写出一个类实例的强引用数永远不能变成0的代码。如果两个类实例互相持有对方的强引用，因而每个实例都让对方一直存在，就是这种情况。这就是所谓的循环强引用
   通过定义类之间的关系为“弱引用”或“无主引用”，以替代强引用，从而解决循环强引用的问题
 */

class PersonPelpeo {
   
    let name: String
    init(name: String){
        self.name = name
    }
    
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}


class Apartment {
    
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: PersonPelpeo?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
//两个类都定义了析构函数，用以在类实例被析构的时候输出信息。这让你能够知晓Person和Apartment的实例是否像预期的那样被销毁

//john 是对PersonPelpeo对象的强引用 unit4A对Apartment对象的强引用
var john: PersonPelpeo? = PersonPelpeo(name: "John Appleseed")
var unit4A: Apartment? = Apartment(unit: "4A")

//john!.apartment类型是Apartment  unit4A!.tenant类型是PersonPelpeo
john!.apartment = unit4A
unit4A!.tenant = john

//断开john和unit4A变量所持有的强引用时，引用计数并不会降为0(因为两个实例持有对方 所以引用计数不为0)，实例也不会被ARC 销毁
john = nil
unit4A = nil


/*
 4 解决实例之间的循环强引用
   swift提供两种解决循环强引用的方法:弱引用和无主引用
   弱引用和无主引用允许循环引用中的一个实例保持强引用而另外一个实例"不保持强引用"。这样实例能够互相引用而不产生循环强引用
   注意:
   1当一个实例的生命周期比较短的时候使用弱引用 当一个生命周期时间比较长的时候使用无主引用
 */

/*4.1 弱引用:弱引用不会对其引用的实例保存强引用 因此不会阻止ARC释放被引用的对象 这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上weak关键字表明这是一个弱引用
    2 弱引用不会保持所引用的实例，即使引用存在，实例也有可能被销毁,ARC会在引用的实例被销毁后自动将其赋值为nil 并且因为"弱引用"可以允许它们的值在运行时被赋值为nil，所以它们会被定义为"可选类型"变量""，而不是"常量"
  注意:当ARC设置弱引用为nil时，属性观察不会被触发
*/

class Person1 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment1?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment1 {
    let unit: String
    init(unit: String) { self.unit = unit }
    //weak 表示对实例的弱引用 当对象销毁时候 该对象会被赋值为nil(因为这个值是可以动态的变化 所以必须是变量 不能为常量) 且是可选类型
    weak var tenant: Person1?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
var john1: Person1? = Person1(name: "John Appleseed")
var unit4A1: Apartment1? = Apartment1(unit: "4A")

john1!.apartment = unit4A1
unit4A1!.tenant = john1

//销毁对象 查看deinit的析构方法是否调用
//Person1 对 Apartment1保持强引用 但是Apartment1对Person1保持弱引用 当john1释放引用时候 Person1对象会释放
john1 = nil
//如此Person1对象销毁 那么Person1内部的属性对象Apartment1的引用就不存在 所以当设置unit4A1为nil时 Apartment对象也会释放
unit4A1 = nil

//注意:在使用垃圾收集的系统里，弱指针有时用来实现简单的缓冲机制，因为没有强引用的对象只会在内存压力触发垃圾收集时才被销毁。但是在 ARC 中，一旦值的最后一个强引用被移除，就会被立即销毁，这导致弱引用并不适合上面的用途

/*
 4.2 无主引用
 1 类似弱引用，无主引用不会牢牢保持住引用的实例 和弱引用不同的是，无主引用在其他实例有相同或者更长的生命周期时使用
 2 你可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用(弱引用定义的类型必须是变量var 而不是常量let)
 无主引用通常都被期望拥有值。ARC无法在实例被销毁后将无主引用设为nil(非可选类型)，非可选类型的变量不允许被赋值为nil
 重要:
 使用无主引用，你必须确保引用始终指向一个未销毁的实例。
 如果你试图在实例被销毁后，访问该实例的无主引用，会触发运行时错误。
 */

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    //无主引用 确保引用指向一个未销毁的实例(无主引用通常被期望拥有值 所以需要定义成常量let) 无主引用不能在对象销毁时候在运行时赋予变量nil  所以该实例类型为非可选类型
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var johnName: Customer?
johnName = Customer(name: "John Appleseed")
johnName!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnName!)
//因为持有Customer对象的变量只有 JohnName   而在Customer内部持有无主引用的实例Creditcard
//当设置johnName为nil Customer的引用计数值为0 对象释放 当对象释放时候 则无对象引用Creditcard对象 Creditcard对象也释放掉
johnName = nil
//如果两个实例对象在对应的实例中运行都可以为nil则使用弱引用 如果允许一个为nil 则使用无主引用


/*
  4.3 无主引用以及隐式解析可选属性
   除了上述的两张情况外 当两个实例对象属性都必须存在值 并且初始化完后属性值永远都不会为nil 这种场景中 需要一个类使用无主引用 而另外一个类使用隐式解析可选属性 使两个属性在初始化完成后能被直接访问（不需要可选展开），同时避免了循环引用
 */

class Country {
    let name: String
    //隐式解包可选类型属性 可以直接访问该属性 不需要再次解包
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        //同时构造City函数 并将值赋给定义的隐式属性
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    //无主引用(指向一个未销毁对象 期望存在值(常量) 实例被销毁时ARC无法将无主引用的对象设置为nil 所以是非可选类型属性类型对象)
    unowned let country: Country
    //将County对象传递给City类型作为属性值
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")


/*
  5 闭包引起的循环强引用
  循环强引用还会发生在当你将闭包赋值给类实例属性的时候、并且这个闭包又使用了这个类实例(闭包可能访问了这个类实例的某个属性、或者方法)这种情况都会导致闭包”捕获“self 引起循环引用
  闭包和类相似都是引用类型、当你把闭包赋值给某个属性的时候、你是将这个闭包的引用值赋给属性 跟类实例一样都是相互的强持有对方 当然跟类实例不一样的是 一个是类实例一个是闭包 而非两个都是类
   swift提供了一种比较优雅的方式来解决这样的问题 称之为”闭包捕获列表“
 */
//闭包引起的强循环引用
class HTMLElement {
    
    let name: String
    let text: String?
    //lazy 表示该属性是延迟属性 第一次调用的时候才会设置初始值
    lazy var asHTML:() -> String = {
        //实例的asHTML属性持有闭包的强引用、 闭包在其闭包体内使用了self（引用了self.name和self.text），因此闭包捕获了self 造成强相互强引用
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
        //注意:虽然闭包多次使用了self，但是它只会捕获实例的一个强引用
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}



var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
//实例的属性持有闭包表示强引用 闭包内部使用实例的方法、实例的属性self 捕获了self 持有实例对象 这样造成循环强引用
paragraph = nil

/*
  6 解决闭包循环强引用
    1 在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用
    2 捕获列表定义了闭包体内捕获一个或者多个引用类型的规则
    3 跟解决两个类实例间的循环强引用一样，声明每个捕获的引用为弱引用或无主引用，而不是强引用。应当根据代码关系来决定使用弱引用还是无主引用
 //注意:Swift只要在闭包内使用self的成员，就要用self.someProperty或者self.someMethod()（而不只是someProperty或someMethod()）。这提醒你可能会一不小心就捕获了self。
 */
//定义捕获列表:捕获列表中的每一项都由一对元素组成，一个元素是weak或unowned关键字，另一个元素是类实例的引用（例如self）或初始化过的变量（如delegate = self.delegate!）。这些项在方括号中用逗号分开
/*
 重点: 如果闭包有参数列表和返回类型，把捕获列表放在它们前面:
 lazy var someClosure: (Int, String) -> String = {
 [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
 // 这里是闭包的函数体
 }
 
 重点: 如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字in放在闭包最开始的地方
lazy var someClosure: Void -> String = {
    [unowned self, weak delegate = self.delegate!] in
    // 这里是闭包的函数体
}
*/

/*
 弱引用和无主引用的区别:
 1:闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用(self的引用)
 2:被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用(定义的可选变量 可能为nil) 弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为nil
 如果被捕获的引用绝对不会变为nil，应该用无主引用，而不是弱引用
*/

class HTMLElement1 {
    
    let name: String
    let text: String?
    //lazy 延迟属性
    lazy var asHTML:() -> String = {
        //闭包捕获列表 定义了self的使用为无主引用
        [unowned self] in
        
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

var paragraph1: HTMLElement1? = HTMLElement1(name: "p", text: "hello, world")
print(paragraph1!.asHTML())

paragraph1 = nil























