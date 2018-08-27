//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
  集合类型
 */
// swift中提供了Array Set Dictionary三种基本集合类型类存储集合数据 Array有序的集合类 Set无序无重复的集合类 Dictionnary无序键值对集合 三者中存储的值类型必须明确 不能插入不确定的数据类型 对取回值的类型保证了我们非常明确 三者被实现多为泛型类型集合
//1 数组Array 使用有序的数据表存储同一类型的多个值 相同的值可以多次出现在一个数组中的不同位置当中 Array更多桥接到NSArray类型
//1.1 swift中的数组应该遵循Array<Int> 这种形式代表数组存储的类型只能是Int类型 也可使用[Int]简短语法来明确数组的类型 推荐使用简短语法命名
let EmptyArray = [Int]()
print("empty array count \(EmptyArray.count)")

//1.2 空数组语句创建一个空数组(当已知数组类型 重新创建时候 依旧是这种类型)
let intValie = 3
var empty_Array = [Int]()
empty_Array.append(intValie)
print("array count \(empty_Array.count)")

empty_Array = []
print("array count \(empty_Array.count)")

//1.3 创建一个特定大小所有的数据都是默认值的数组
var threDoubles = Array(repeating: 0.01, count: 3)

//1.4  通过两个数据相加来创建一个同类型的数组 新数组的类型会从两个数组中的类型的推断出来
var twoDoubles = Array(repeating: 0.02, count: 3)

var newDoubles = twoDoubles + threDoubles

//1.5 字面量构造:数组字面量来构造数组 使用一个或者多个数值来构造数组 数组字面量使用一系列逗号分隔并由[]包含数值
var shoppinglist: [String] = ["mile","other"]
var shoppingOther = ["egg","Milk"]
var intArray: [Int] = [1,2,3,4]

//2 访问和修改数组 通过数组的属性和方法来修改和访问数组
//2.1  数组数量
print("intArray count \(intArray.count)")

//2.2 isEmpty 数组数量
if intArray.isEmpty {
    print("is empty")
}else{
    print("is not empty")
}

//2.3 append(_:)方法在数组后面添加新的数据项
intArray.append(5)

//2.4 加法赋值运算符（+=）添加数据
intArray += [7,8,9]

//2.5 通过下标访问数据
var fristString = intArray[0]
//Array.first 返回可选类型值
var fristString_1 = intArray.first
//2.6 使用下标来改变某个索引对应的值
intArray[0] = 0
//数组对应的下标为0的值不是1 而是0
print(intArray)
//2.7 改变一系列数据值 即使新数据和原有数据的数量是不一样的
intArray[0...2] = [1,2]
print(intArray)

//注:不可以使用下标访问的形式在数组的尾部添加数据
//intArray[9] = [10]

//2.8 inset(_:at:) 在某个下标数据的前面添加数据
intArray.insert(3, at: 2)
print(intArray)

intArray.insert(contentsOf: [5,6], at: 5)
print(intArray)

//2.9 数据的移除 remove(at:) 根据索引移除对应数据 移除数据后数据索引空值会自动的填补
intArray.remove(at: 4)
print(intArray)

//移除最后一个数据
intArray.removeLast()
print(intArray)
//移除第一个数据
intArray.removeFirst()
print(intArray)
//2.10 数组的便利
for item in intArray {
    print(item)
}

//2.11 enumerated()方法来进行数组遍历 该方法会返回数据的索引值和对应的值组成的元组
for (index,item) in intArray.enumerated(){
    print(index,item)
}

/* 3 Set 集合用来存储相同类型并且没有确定顺序的值 当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组
 */
//3.1 集合类型的哈希值 一个类型存储在Set中 该类型的值必须是可以哈希化的 必须存在这计算该哈希值的方法 哈希类型是Int类型 相等对象的哈希值必定相等 a=b a.hashValue = b.hashValue
//3.2 swift 的所有基本类型都是可以hash化的(Int,Double,Float,Bool,string)可以作为Set的值和字典的键存在 没有关联值的枚举成员值默认也是hash化的
//3.4 你可以使用你自定义的类型作为集合的值的类型或者是字典的键的类型，但你需要使你的自定义类型符合 Swift 标准库中的Hashable协议。符合Hashable协议的类型需要提供一个类型为Int的可读属性hashValue
//3.5 Set 集合类型定义写成Set<Int> Int表示集合允许存储的类型数据 Set集合没有简化语法
var emptySet = Set<Int>()
//3.6 当已知集合存储的类型数据 可以通过空的数组字面量创建空的集合Set
empty_Array.append(0)
empty_Array = []
//3.7 数组字面量来创建集合 可以写一个或者多个元素作为集合元素

var SetValue: Set<Int> = [0,1,2]
//Set类型不能从数组字面量中被单独推断出来，因此Set类型必须显式声明 而存储的数据类型则可以被推断出来
var SetValue1: Set = [0,1,2]
print(SetValue1)

//3.8 访问和修改集合
//3.8.1 集合数据的元素数量
print(SetValue1.count)
//2.8.2 使用BOOL值来判断集合是否存在元素
if SetValue1.isEmpty {
    print("empty")
}else{
    print("not empty")
}
//3.8.3 添加 插入元素 (尾部添加元素)
SetValue1.insert(3)
print(SetValue1)
//3.8.4 移除集合元素(返回数据为可选类型) 如果成功则删除集合元素并返回删除元素 失败返回nil
if let set_value = SetValue1.remove(0){
    
    print(set_value)
}
print(SetValue1)

//3.8.5 contains(_:)来检查集合是否包含某个元素 返回BOOL值类型
if SetValue1.contains(2) {
    print("true")
}
print(SetValue1)
//3.8.6 变量一个集合色所有元素
for item in SetValue1 {
    print(item)
}
//3.8.7 set集合本来无顺序 为了按照特定的顺序来遍历一个Set中的值 可以使用sorted() 返回一个有序的数组
for setValue in SetValue1.sorted() {
    
    print(setValue)
}
let setArray = SetValue1.sorted()

//3.9 Set的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
//3.9.1 intersection(_:)两个集合中都包含的值创建一个新的集合
let newSet1 = oddDigits.intersection(evenDigits)
print(newSet1)
//3.9.2 symmetricDifference(_:) 在一个集合中但不在两个集合中的数据创建集合
let newSet2 = oddDigits.symmetricDifference(evenDigits)
print(newSet2)
//3.9.3 union(_:)根据两个集合的值创建一个新的集合
let newSet3 = oddDigits.union(evenDigits).sorted()
//3.9.4 subtracting(_:) 在父类集合不做被比较集合中的值创建一个新集合
let newSet4 = oddDigits.subtracting(singleDigitPrimeNumbers)

//3.10 集合成员关系和相等
//3.10.1 ==判断两个集合的成员是否一致相等
let set1: Set = [0,1,2,3]
let set2: Set = [0,1,2,3,4,5]
let set3: Set = [8,9,10]
let set4: Set = [10,11,12]


if set1==set2 {
    print("true")
}else{
    print("false")
}
// 3.10.2 isSubset(of:) 一个集合的值是否也包含在另外一个集合中
let bl = set1.isSubset(of: set2)
let b2 = set2.isSubset(of: set1)

//3.10.3 isSuperset(of:) 一个集合包含另外一个集合的所有值
let b3 = set2.isSuperset(of: set1)

//3.10.4 isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等
let b4 = set1.isStrictSubset(of: set2)
let b5 = set2.isStrictSuperset(of: set1)

//3.10.5  isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)
let b6 = set2.isDisjoint(with: set3)
let b7 = set4.isDisjoint(with: set3)

/*
 4 字典Dictionar:字典存储多个相同类型的容器 每个值关联唯一的key 键作为对应值的标识符 字典的数据同样具有不规则的顺序 需要通过标识符类访问的数据一般都是用字典类处理
 */
//4.1 Swift 的字典使用Dictionary<Key, Value>定义，其中Key是字典中键的数据类型，Value是字典中对应于这些键所存储值的数据类型  字典的Key类型必须遵循Hashable协议
//4.2 字典和数组一样都拥有简短语法
var dict = [Int:String]()

//4.3 上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作[:]
dict[0] = "0"
print(dict)
//空字典字面量创建字典(前提是已经知道字典的键值类型)
dict = [:]

//4.4 字典字面量创建字典 字典字面量是一种将一个或多个键值对写作Dictionary集合的快捷途径
var dict1: [String:String] = ["0":"0","1":"1","2":"2"]

//字典字面量构造字典时，如果它的键和值都有各自一致的类型 那么就不必写出字典的类型
var dict2 = ["0":"0","1":"1","2":"2"]

//4.5 访问和修改字典 字典的数量
print("dict count\(dict2.count)")

//4.5.1 isEmpty 检查字典是否为空
let b8 = dict2.isEmpty

//4.5.2 典中使用下标语法来添加新的数据项
dict2["3"] = "3"
print(dict2)

//4.5.3 使用下标语法来改变特定键对应的值
dict2["1"] = "0"
print(dict2)

//4.5.4 updateValue(_:forKey:)方法可以设置或者更新特定键对应的值 updateValue(_:forKey:)方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的值 updateValue(_:forKey:)这个方法返回更新值之前的原值(可选值) 否则它将会是nil
let dictV = dict2.updateValue("1", forKey: "1")
print(dictV ?? INTMAX_MAX)
print(dict2)

//4.5.5  使用下标语法来在字典中检索特定键对应的值 因为有可能请求的键没有对应的值存在，字典的下标访问会返回对应值的类型的可选值

if let value = dict2["0"] {
    print(value)
}

//4.5.6 移除字典中的数据 可以通过给键对应的值赋nill来移除
dict2["0"] = nil
print(dict2)

//4.6.6 removeValue(forKey:)方法也可以用来在字典中移除键值对。这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回nil(返回先前的值为可选类型)
let removeValue = dict2.removeValue(forKey: "1")
print(removeValue ?? INTMAX_MAX)

//5.1 字典的遍历 每一个字典中的数据项都以(key, value)元组形式返回，并且我们可以使用临时常量或者变量来分解这些元组
for (key,value) in dict2 {
    
    print(key,value)
}

//5.2 遍历字典的key 获取对应的key的值
for value in dict2.keys {
    
    print(value)
}

//5.3 遍历字典对应的value集合
for value in dict2.values {
    
    print(value)
}

//5.4 获取字典的keys或者values来创建一个新的数组(数组是全部的key或者value组成)
let array1 = dict2.values.sorted()
let array2 = dict2.keys.sorted()
print(array1,array2)




