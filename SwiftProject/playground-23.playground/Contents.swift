//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
  类型转换
   1 类型转换:可以判断实例的类型、也可以将实例看作是其父类或者子类的实例
   2 类型判断在swift中使用is和as操作符来实现、这两种操作符提供了一种简单达意的方式去检查值的类型和转换它的类型(is 检查类型、as 转换类型)
   同样可以使用is来检查某个类是否实现了某种协议
 */
class MediaItem{
    
    var name: String
    init(name: String) {
        self.name = name
    }
}


class Movie: MediaItem {
    
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
//library 是 MediaItem类型
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

/*
 1 检查类型
  使用操作符is来检查一个实例是否属于一个特定类型的子类型、若实例属于该子类型则类型操作符返回true 否则返回false
 */
var movieCount = 0
var songCount = 0

for item in library{
    
    if item is Movie {
      
        movieCount += 1
        
    }else if item is Song {
       
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

/*
  2 向下转型
  某类型的一个常量或者变量可能在幕后实际上属于一个“子类”、当你确定是这种类型的时候可以向下转到它的子类型 使用类型转换符(as!、as?)
 类型转换操作符带有两种不同的形式:
 1 条件转换:as? 返回一个你试图向下转换成功的可选值、当你向下转换的时候不确定是否可以成功的时候 用类型转换中的条件转换(as?) 条件转换总是返回一个可选值 如果转换不成功则返回nil、这是你能够坚持向下转换是否成功。
 2 强制形式:as! 把试图向下转换和强制解包转换结果结合为一个操作、只有当你确定向下转化一定会成功的时候、才使用强制转换(as!)、当你向下转换一个不确定类型的时候、强制转换会报出运行时错误
 
 注意:转换没有真的改变实例或它的值。原本的实例保持不变；只是简单地把它作为被转换成的类型来使用
 
 */
//将类型转换成功后可以使用相关类型的属性
for item in library {
    
    if let movie = item as? Movie {
        
     print("Movie: '\(movie.name)', dir. \(movie.director)")
        
    }else if let song = item as? Song{
        
       print("Song: '\(song.name)', by \(song.artist)")
    }
}

/*
  Any和AnyObject的类型转换
  swift为不确定的类型提供了两种特殊的类型别名:
  1 Any可以表示任何的类型、包括函数类型
  2 AnyObject可以表示任何的类类型的实例
 
  只有当你确定需要使用他们的行为和功能的时候才使用Any和AnyObject、在你的代码中使用明确的类型总是更好的
 */

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })


//Any类型可以表示所有类型的值，包括可选类型。当你希望用Any类型来表示一个可选值的时候、swift会给你一个警告、如果你确实希望使用Any类型来表示可选类型、你可以使用as操作符来显示的转换为Any类型
let optionalNumber: Int? = 3

//会出现警告
things.append(optionalNumber)
//不会有警告
things.append(optionalNumber as Any)
































