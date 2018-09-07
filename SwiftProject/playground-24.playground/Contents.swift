//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
  嵌套类型
 1 Swift 允许你定义"嵌套类型"，可以在支持的类型中定义嵌套的"枚举、类和结构体"
 2 要在一个类型中嵌套另一个类型，将"嵌套类型"的定义写在某个类型定义的外部类型的花括号({})内，而且可以根据需要定义多级嵌套。
 */
//1 嵌套类型的事件
enum person: String{
    //枚举定义的初始值可以有也可以没有、在同一行中的枚举成员可以定义初始值、定义的新一成员值可以不定义初始值
    case Tome = "Tom",Alien = "Alien"
    case Jack
}

let name = person(rawValue: "Tom")



struct BlackjackCard {
    
    // 嵌套的 Suit 枚举
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    // 嵌套的 Rank 枚举
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")


/*
  2 引用嵌套类型
   在外部引用嵌套类型时，在嵌套类型的类型名前加上其“外部类型的类型名”作为前缀
   引用嵌套类型的时候 使用嵌套类型所在的类型进行调用嵌套类型
 */
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue




















