import UIKit

var str = "Hello, playground"
/**
 * 泛型
 */
/*
 * 泛型可以让你根据自定义的需求、编写出适用于任意类型的、灵活可重用的的“函数”和“类型”、它能避免你的代码重复使用、用一种清晰和抽象的的方式来表达代码的意图
   泛型湿swift强大的特性之一、许多swift标准库都是通过泛型构造的、Array、Dictionary都是泛型类型的集合、元素可以是swift类型的任意类型
 */
//1 非泛型类型(交换两个Int值)  inout:标记参数为输入输出参数
func swapTwoInts(_ a: inout Int,_ b: inout Int){
    let temp = a
    a = b
    b = temp;
}
var a_v = 2
var b_v = 3
swapTwoInts(&a_v, &b_v)
//2 string类型
func swapTwoStrings(_ string1:inout String,_ string2: inout String){
    let stringTemp = string1
    string1 = string2
    string2 = stringTemp
}
var s1_v = "你好"
var s2_v = "好"
swapTwoStrings(&s1_v, &s2_v);
//重上面的两个不同类型的函数中可以看出、函数的功能一样、唯一的不同之处是传入的变量类型是不一样的、但是同一个函数传入的类型必须相同、不然转换不了
// 通常情况下 需要一个更灵活的函数来根据不同的传入类型来交换任意的类型值、然而泛型就解决这样的代码乏力的问题(传入的类型的两个值必须相同、不然不能能交换、swift是类型安全语言)
/*
 * 2 泛型函数
 */
func swapTwoValue<T>(_ a: inout T,_ b: inout T){
    let tmpe = a
    a = b
    b = tmpe
}
//1 泛型版本使用了占位类型名“T”来替代实际类型名（String、Int、Double)、占位类型名没有指明T必须是什么类型、但是它指明泛型函数参数a、b必须是同一类型T、无论T代表什么类型、只有当swapTwoValue函数调用的时候、才会根据传入的类型决定T所代表的类型(T所代表类型根据传入的参数类型推断出来)
//2 泛型版本和非泛型版本的区别在于、泛型函数名后面跟着占位类型名(T(这个名字随便写 但是最好写成T、swift推荐))、并用<>括弧给括起来使用、这个<>括号号告诉swift这个T是这个泛型函数定义内的一个占位类型名、因此swift不回去查找名为T的实际类型
var A = 12
var B = 20
swapTwoValue(&A, &B)

var S1 = "hello"
var S2 = "word"
swapTwoValue(&S1, &S2)
//swapTwoValue 函数是根据swift中的swap(_ : _)函数启发的、如果代码有需要可以直接使用swift库中的swap(_ : _)函数
/*
 * 2 类型参数:"上面的泛型函数中占位类型T是"类型参数""、类型参数指定并命名一个占位类型T、并且紧跟在函数名后面、使用<>括号括起来使用(函数的占位类型T的具体类型还是根据传入的参数类型来决定的、传入的参数是什么类型、类型参数就是什么类型)、 当一个类型参数被指定的时候、你可以用它来指定一个参数类型、或者函数的返回类型、"你可以在定义类型参数T的时候可以定义多个类型参数、使用<>扩起来 使用逗号分隔"
 */
/*
 * 3 类型参数的命名:大多情况下、类型参数具有一个描述的命名、Dictionary<Key, Value> 中的 Key 和 Value，以及  Array<Element> 中的 Element
     当他们没有关系意义的时候使用大写字母T U V等命名
     使用驼峰原则的命名来为类型参数命名、表面它是一个占位类型不是一个参数
 */
/*
 * 4 泛型类型:除了泛型函数、swift还允许你自定义泛型类型、自定义的泛型类型、类泛型类型、结构体泛型类型、枚举泛型类型、可以使用任何类型、类似于Array、Dictionnary
 */
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
//创建了一个泛型类型的实例 "String类型"
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
let fromTheTop = stackOfStrings.pop()
/*
 * 5 扩展一个泛型类型:"当你扩展一个泛型类型的时候、你并不需要在扩展的定义中提供类型参数列表、原始类型定义中声明的类型参数列表在扩展中可以直接使用"、并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用
 */
extension Stack {
    //直接定义成为Element泛型类型
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
/*
 * 6 类型约束:上面定义的stack类型可以作用在任意类型中、不过如果有时候能够将泛型函数和泛型类型中的类型添加一个特定的约束、将会是非常有用的、类型约束可以指定一个类型参数必须继承自指定类、或者符合一个特定的协议或者协议组合。
     当你创建自定义泛型时候、你可以自定义你自己的类型参数的约束、这些约束将提供更为强大的泛型编码能力
 */
// 6.1:类型约束语法:你可以在一个类型参数名后面放一个类名或者协议、并用冒号分隔、来定义类型约束、他们将成为类型参数列表的一部分、
class SomeClass{
}
protocol SomeProtocol{
}
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // 这里是泛型函数的函数体部分
}
//上面这个函数有两个类型参数。第一个类型参数 T，有一个要求 T 必须是 SomeClass 子类的类型约束；第二个类型参数 U，有一个要求 U 必须符合 SomeProtocol 协议的类型约束
//6.2:类型约束的实践
//非泛型通用函数
func findIndex(ofString valueToFind: String, _ array:[String]) ->Int?{
    for (index,value) in array.enumerated() {
        if valueToFind == value {
            return index;
        }
    }
    return nil;
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let findValue = findIndex(ofString: "cat", strings) {
     print("The index of cat is \(findValue)")
}
//将上面的函数转化为泛型类型函数
func findIndex<T:Equatable>(of valueToFind: T, in array:[T]) -> Int?{
    for (index, value) in array.enumerated() {
        //使用相等会出现在==报错、因为swift无法知道你自定义的泛型类型中的==意味什么、正因如此，这部分代码无法保证适用于每个可能的类型T、但是swift库中定义了一个标准的Equatable 协议 该协议要求任何遵循该协议的类型必须实现等式符（==）及不等符(!=)，从而能对该类型的任意两个值进行比较
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex 类型为 Int?，其值为 nil，因为 9.3 不在数组中
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
/*
 * 7 关联类型:(关联协议定义在协议中)定义协议的时候、声明一个或者多个关联类型作为协议的d定义一部分将会非常有用、关联类型为协议中的某个类型提供了一个占位名(或者别名)，其代表的实际类型在协议被采纳的时候才被指定、通过associatedtype关键字来指定关联类型
 */
protocol Container{
    //ItemType是定义在协议中的一个关联类型 就是定义了一个类型的别名、当在遵循的类、结构体、枚举中再具体的定义ItemType代表的类型、
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack:Container{
    
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    //指定协议中的关联类型中的类型 因为类型推断、则协议中的关联类型会被推倒为Int类型
    //下面关联类型的定义可要可不要、因为swift可以通过类型推断来确定
   // typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    //根据下标查找返回值
    subscript(i: Int) -> Int {
         return items[i]
    }
    var count: Int{
        return items.count
    }
}
//上面的结构体中指定了关联类型的类型为Int 但是根据类型推断 不指定类型为typealias ItemType = Int为Int类型、swift依旧可以推断出类型为Int类型
//让泛型类型遵循定义了关联类型的协议
struct Stack2<Element>:Container{
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    //Swift 可以据此推断出 Element 的类型即是 ItemType 的类型
    typealias ItemType = Element
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
    var count: Int {
        return items.count
    }
}
/*
 * 7.2 通过扩展一个存在的类型来指定关联类型
 Swift 的 Array 类型已经提供 append(_:) 方法，一个 count 属性，以及一个接受 Int 类型索引值的下标用以检索其元素。这三个功能都符合 Container 协议的要求，也就意味着你只需简单地声明 Array 采纳该协议就可以扩展 Array，使其遵从 Container 协议
 */
extension Array:Container{}
//定义了这个扩展后，你可以将任意 Array 当作 Container 来使用
/*
 * 7.3 约束关联类型:你可以给协议中定义的关联类型添加类型约束、让遵循该协议的类型必须遵循该关联类型定义的约束条件
 */
protocol Container2 {
    //关联类型添加Equatable协议
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
//遵循Container2协议的类型 关联类型中的类型必须遵循Equatable协议、该结构体的关联类型正是T
struct classContainer2<T:Equatable>:Container2{
    var arrays = [T]()
    var count: Int{
        return arrays.count
    }
    func append(_ item: T) {
    }
    subscript(i: Int) -> T {
       return arrays[i]
    }
}
/*
 * 8 泛型where语句
  为关联类型定义约束也是非常有用的、
 1 你可以在参数列表中通过where语句为关联类型定义约束、你能通过  where 子句要求一个关联类型遵从某个特定的协议 以及某个特定的类型参数和关联类型必须类型相同
 2 可以通过将 where 关键字紧跟在类型参数列表后面来定义 where 子句，where 子句后跟一个或者多个针对关联类型的约束
 3 以及一个或多个类型参数和关联类型间的相等关系
 4 你可以在函数体或者类型的大括号之前添加 where 子句
 */
//泛型参数列表中具有Where语句
func allItemsMatch<C1: Container, C2: Container> (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        // 检查两个容器含有相同数量的元素
        if someContainer.count != anotherContainer.count {
            return false
        }
        // 检查每一对元素是否相等
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        // 所有元素都匹配，返回 true
        return true
}
var stackOfStrings1 = ["uno", "dos", "tress"]
var arrayOfStrings = ["uno", "dos", "tres"]
//定义是泛型类型  可以是任意类型
//因为Array之前已经扩展了Container协议
var bl = allItemsMatch(stackOfStrings1, arrayOfStrings)
/*
     泛型类型的扩展张具有where语句
 * 9 具有泛型where子句的扩展
     你也可以使用泛型 where 子句作为扩展的一部分
 */
//使用where语句在类型为泛型的类型上 表明参数类型必须遵循对应协议
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

extension classContainer2 where T: Equatable {
    func startsWith(_ item: T) -> Bool {
        return count >= 1 && self[0] == item
    }
}
//编写一个泛型 where 子句去要求 Item 为特定类型 为Double类型
extension classContainer2 where T == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
/*
 * 10 关联语句中具有Where语句
      你可以在关联类型后面加上具有泛型where的字句
 */
protocol Container3 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    //IteratorProtocol就是将定义的条件添加到哪个类型上 表示添加到IteratorProtocol类型上
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}
/*
 * 11 泛型下标
      下标可以是泛型的 它能够包含泛型ewhere语句 你可以把占位符类型的名称写在 subscript 后面的尖括号里，在下标代码体开始的标志的花括号之前写下泛型 where 子句
 */
struct struct1{
    
    var arrays = [String]()
}
extension struct1 {
    subscript<Indices: Sequence>(indices: Indices) -> [String]
        where Indices.Iterator.Element == Int {
            var result = [String]()
            for index in indices {
                result.append(self.arrays[index])
            }
            return result
    }
}
