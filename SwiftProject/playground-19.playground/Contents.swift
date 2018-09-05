//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
  析构过程
 */
//析构器只适用于类类型中(class)、当一个类的实例被释放之前析构器会被立即调用 析构器用关键字deinit来表示、类似于构造器init关键字

/*
 1 析构的原理
 swift会自动释放不需要的实例以释放资源 swift通过自动引用计数处理实例内存的管理 通常当你的实例释放的时候是不需要你手动的释放内存的 但是当你使用的是自己的资源的时候 你可能就需要一些额外的处理 但你使用类写入文件或者删除文件的时候 当实例释放时候 需要你去清理文件资源内存
 */

class myObject{
    
    deinit {
        // 执行析构过程
    }
    
}

//析构器是在实例释放发生前被自动调用。你不能主动调用析构器。子类继承了父类的析构器，并且在子类析构器实现的最后，父类的析构器会被自动调用。即使子类没有提供自己的析构器，父类的析构器也同样会被调用


/*
 2 析构的实践
 */
class Bank{
    //属性前面添加static关键字 表示属性属于类型属性 但是计算类型属性前面可以将static改为calss关键字 表示子类对父类的计算属性可以重写
    static var coinsInBank = 10000
    //方法前面添加static 表明是类型方法(类方法)
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

//玩家
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    //析构器返回玩家的游币到Bank对象
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
//定义可选表示玩家是否在游戏中
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")



playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")


playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")


//当对象不存在时候 将可选类型的playerOne变量设置为nil来表示 意味着“没有Player实例” playerOne变量对Player实例的引用被破坏了 没有其它属性或者变量引用Player实例，因此该实例会被释放 调动deinit方法 然后是否对象 回收内存资源









