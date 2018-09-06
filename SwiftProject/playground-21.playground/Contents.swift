//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
  可选链:可选链式调用必须作用在“可选值"上或者作用返回值为“可选值”上
 */
/*可选链式调用:是一种可以在当前值可能为nil的“可选值”上请求和调用属性、方法以及下标的方法。如果可选值有值(存在对象)、那么调用成功 如果“可选值”调为nil 则调用将返回nil 表示失败。多个调用可以连在一起形成一个调用链 如果其中的任何一个调用链的节点为nil 整个调用链都会失败 返回nil
  swift的可选链式可以用于任何的类型、并且可用于检查调用是否成功
*/

/*
 1 使用可选链式调用代替强制展开
  通过在想调用的属性、方法、下标的"可选值"后面添加(?) 可以定义一个可选链 类似在可选值后面添加(!)进行隐式解包值。它们的区别在于可选链调用可选值如果为nil时候则会调用失败、可选值强制展开则会报运行时错误
 1 为了反应可选链调用可以在空值上调用的事实 不论这个调用的属性、方法、下标“返回值”是不是“可选值”、它的返回结果都将默认是一个“可选值”。
 2 可以利用返回值类判断可选链式调用是否成功 如果调用有返回值 则表示成功 返回nil 则表明表用失败
 3 可选链式调用的返回值类型和原本返回值的类型都是一样的、但是被包装成一个可选值
 */

class Person1 {
    
    var residence: Residence1
    var pepple: People1?
    
    init() {
        self.residence = Residence1()
        self.pepple = People1()
    }
}

class Residence1 {
    var numberOfRooms = 1
}

class People1{
    
    var peopleNumber = 10
    
}

let person1 = Person1()
//可选链式调用(调用的属性、方法、下标的对象需要被定义为可选类型)
/*
let number = person.residence?.numberOfRooms
 如果不是可选类型在属性的后面添加(?)表示可选链式调用会出现运行时错误
*/
//使用强制解包来获取对象值会出现运行时错误、因为pepple对象为nil 不存在展开的值
/*
 let numberValue = person.pepple!.peopleNumber
*/
//使用可选链式调用来展开(在可选值后面添加?来表示可选链)
let number = person1.pepple?.peopleNumber

if number != nil {
    
    print(number!)
}

/*
 2 定义可选链式模型
 */
class Person {
    var residence: Residence?
}


class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}


class Room {
    
    let name: String
    init(name: String){
        self.name = name
    }
}


class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    //定义的方法的返回值为可选类型
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(String(describing: buildingNumber)) \(String(describing: street))"
        } else {
            return nil
        }
    }
}

/*
 3 通过可选链式调用访问属性
 可以通过可选链式调用在一个可选值上访问它的属性，并判断访问是否成功
 */

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
//因为residence为nil(只要可选链中的任何一个节点为nil 则整个可选链都会失败 返回nil)
john.residence?.address = someAddress
//上述中可选链调用失败 则表明等号的右侧代码不会执行 但是对于上面的代码形式很难判断右侧代码是否执行了 我们可以将右侧的代码封装成方法 将该实例的返回值作为实例的值 以此来验证代码是否被调用执行
func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
//内部打印为执行 则改属性的未被赋值
john.residence?.address = createAddress()


/*
 4 通过可选链式调用调用方法
  可以通过可选链式调用方法 并判断是否调用成功，即使这个方法没有返回值(m没有返回值的方法具有隐式的返回类型Void 也能放回() 空元组)
  可选值上通过可选链式调用来调用这个方法，该方法的返回类型会是Void? 通过判断返回值是否为nil可以判断调用是否成功
 */
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

/*
 5 通过可选链式调用访问下标
  通过可选链式调用，我们可以在一个可选值上访问下标，并且判断下标调用是否成功
  注意:通过可选链式调用访问可选值的下标时，应该将问号放在下标方括号的前面而不是后面。可选链式调用的问号一般直接跟在可选表达式的后面
 */

//使用下标访问对象的属性(下标 subscript)
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
//可选链式赋值
john.residence?[0] = Room(name: "Bathroom")


let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

/*
 5.2 访问可选类型的下标
 如果下标返回可选类型值 (字典下标返回值的类型是可选类型)可以在下标的结尾括号后面放一个问号来对其可选返回值进行可选链式调用
 */
//字典返回的值类型是可选类型
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]

testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
//使用可选链调用获取字典的值
let valueq = testScores["Dave"]?[0]


/*
6 连接多层可选链式调用
 可以通过连接多个可选链式调用在更深的模型层级中访问属性、方法以及下标。然而，多层可选链式调用不会增加返回值的可选层级
 
 如果你访问的值不是可选的，可选链式调用将会返回可选值。
 如果你访问的值就是可选的，可选链式调用不会让可选返回值变得“更可选
 
 通过可选链式调用访问一个Int值，将会返回Int?，无论使用了多少层可选链式调用。
 类似的，通过可选链式调用访问Int?值，依旧会返回Int?值，并不会返回Int??。

 */
//Address的street的返回值为可选类型 即使使用多层的可选链调用该属性 street的返回值依然是可选值 不会是双层可选放回值
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

/*
 7 在方法的可选返回值上进行可选链式调用
   1 我们可以在一个可选值上通过可选链式调用来获取它的属性值
   2 我们还可以在一个可选值上使用可选链式调用来调用方法
   3 我们还可以在一个可选值调用的方法返回的可选值上面继续使用可选链式继续调用
 */
 //属性可选值上使用可选链调用方法
if let buildingIdentifier = john.residence?.address?.buildingIdentifier(){
    print("John's building identifier is \(buildingIdentifier).")
}

//方法的可选值基础上继续使用可选链调用(?使用在buildingIdentifier()后面是因为可选链作用在方法可选返回值上 而不是方法本身上)
if let buildingValue = john.residence?.address?.buildingIdentifier()?.hasPrefix("The"){
    
    if buildingValue {
        
        print("John's building identifier begins with \"The\".")
        
    }else{
         print("John's building identifier does not begin with \"The\".")
    }
    
}
















