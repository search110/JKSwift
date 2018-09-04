//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
   继承
 */
//1 一个类可以继承另外一个类的方法、属性和其他的特征 当一个类继承其他类的时候、继承类叫子类 被继承类叫超类 在swift中 继承是区别类和其他类型的一个重要特征 2 继承的类可以访问和调用父类的方法 属性和下标 并且可以重写某些方法 属性和下标类优化某些行为 swift当然会匹配你在父类中的这些定义是否匹配 确保你重新是否正确  3 可以为继承来的任何属性添加属性观察器
//不继承其他类的类叫做基类，swift中的类不是从一个通用的类中继承而来的 如果你不为你的定义的类指定一个基类的话 这个类就自动成为基类

class Vehicle{
    
    var currentStep = 0.0
    
    var description:String{
        
        return "traveling at \(currentStep) miles per hour"
    }
    
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}

let someVehicle = Vehicle()


//子类生成:在一个已有的类中生成一个新类 子类继承超类的属性 你还可以为子类添加新的特性

class Bicycle: Vehicle{
   
    var hasBasket = false

}

let bicycle = Bicycle()

bicycle.hasBasket = true
bicycle.currentStep = 15.0
print(bicycle.currentStep)


//子类还可以继续被继续 这样Tandem可以继承Bicycle 和Vehicle的属性 方法和特性
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()

tandem.currentNumberOfPassengers = 10
tandem.currentStep = 20.0
tandem.hasBasket = true

print(tandem.currentNumberOfPassengers)

//重写:子类可以为继承来的实例方法、实例属性、类方法或者下标提供自己定制的实现我们把这样的方法叫重写
//如果想重写就必须再重写的前面添加override关键字 这表明你想重写一个版本 任何缺少override关键字的重新都会被编译为编译错误 override会体现编译器去查看父类是否匹配重写声明 这个检查保证你重新的定义是否正确

//父类的属性、方法、下标:子类重新父类的属性、方法、下标将会是得你的功能更加完善和收益 不需要重新定义 通过使用super 来调用父类的属性、方法、下标

//方法:在方法someMethod()的重写实现中，可以通过super.someMethod()来调用超类版本的someMethod()方法

class Train:Vehicle{
   //重新继承Vehicle父类的方法
    override func makeNoise() {
       
        print("superclass method")
    }
}

let train = Train()
train.makeNoise()

//在属性someProperty的 getter 或 setter 的重写实现中，可以通过super.someProperty来访问超类版本的someProperty属性。
//你可以重写继承来的实例属性和类型属性 提供自己定义的setter和getter方法 或者添加属性观察器是重写的属性可以观察值的变化
//重新属性的getter和setter方法 可以将一个继承来的只读属性重写为一个读写属性 只需要在重写版本的属性里提供 getter 和 setter 即可 但是，你不可以将一个继承来的读写属性重写为一个只读属性
//注意: 如果你在重写属性中提供了 setter，那么你也一定要提供 getter 如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值

//重新属性可以不写setter 但是getter方法必须写
class Car: Vehicle{
    
    var gear = 1
    //重新的属性如果你不需要getter属性 可以直接使用父类 使用super调用
    override var description: String{
        
        return super.description
    }
}

let car = Car()
car.currentStep = 12.0
car.gear = 3
print("Car: \(car.description)")

//在下标的重写实现中，可以通过super[someIndex]来访问超类版本中的相同下标

//重写属性观察器:你可以通过重写属性为一个继承来的属性添加属性观察器 当继承来的属性值发生改变时，你就会被通知到，无论那个属性原本是如何实现的
//注意:1 你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器 这些属性的值是不可以被设置的 2 你不可以同时提供重写的 setter 和重写的属性观察器 如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了(setdid 和 set 不能同时出现)

class AutomaticCar:Car{
    //重新的属性添加属性观察器
    override var currentStep: Double{
        //属性观察器
        didSet{
            gear = Int(currentStep / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentStep = 35.0
print("AutomaticCar: \(automatic.description)")


class automaticCar1:Car{
    //重新的属性添加setter和getter方法
    override var currentStep: Double{
        //setter方法
        set{
            
        }
        get{
            return 10.0
        }
    }
}

//防止重写:通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）

//如果你重写了带有final标记的方法，属性或下标，在编译时会报错。在类扩展中的方法，属性或下标也可以在扩展的定义里标记为 final 的

//你可以通过在关键字class前添加final修饰符（final class）来将整个类标记为 final 的。这样的类是不可被继承的，试图继承这样的类会导致编译报错

 class Some{
    //是不可以被继承的
    final var name = "h"
    
    var name1 = "he"
    
}

class Someq:Some{
    
    override var name1: String{
        
    }
//重新不可被继承的属性方法会出错
//    override var name: String{
//
//    }
}

//表示Some1是不可以被继承的类
final class Some1{
    
}










