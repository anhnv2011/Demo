import UIKit

@propertyWrapper
struct Capitalized {
    private var value: String
    var wrappedValue:String{      //phải có ko sẽ báo lỗi
        get {
            value
        }
        set {
            value = newValue.capitalized
        }
    }
    init(wrappedValue: String) {
        value = wrappedValue.capitalized
    }
}

@propertyWrapper
struct Capitalized2 {
    var wrappedValue:String{
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }
    
}

struct Book {
    @Capitalized var author: String
    @Capitalized2 var tittle: String
}

var book = Book(author: "asd", tittle: "hgfbfgb")
//print(book.author) // print Asd
//print(book.tittle) // chưa chạy vì chưa có giá trị ban đầu nên didset chưa chạy
book.tittle.append("k")
//print(book.tittle) //print Hgfbfgbk



//MARK:- vì chưa có giá trị khởi tạo ban đầu, nên khi cung cấp giá trị lần đầu nó chỉ chạy get, sau đó cung cấp giá trị mới nó sẽ chạy set rồi mới get
//generic
@propertyWrapper
struct MyDouble<T: Numeric> {
    private var value: T
    var wrappedValue: T {
        get {
            value * 2
        }
        set {
            value = newValue
        }
    }
    init(wrappedValue: T) {
        self.value = wrappedValue
    }
}

class TestClass {
    @MyDouble var count:Float
    @MyDouble var total: Int = 10
    init(count: Float) {
        self.count = count
    }
}
var test = TestClass(count: 11)
//print(test.count)
//print(test.total)

test.count = 18
//print(test.count)



//projectedValue

@propertyWrapper
struct Triple {
    var value:Double
    
    var projectedValue = false
    var wrappedValue:Double{
        get {
            value * 2
        }
        set {
            value = newValue * 3
           // print(value)
            projectedValue = newValue > 7
        }
    }
    init(wrappedValue: Double) {
        value = wrappedValue
    }
    
}

class Follower {
    @Triple var follow: Double
    init(follow: Double) {
        self.follow = follow
    }
}

//let follow = Follower(follow: 2)
//print(follow.follow)
//print(follow.$follow)
//
//follow.follow = 8
//print(follow.follow)
//print(follow.$follow)
//
//follow.follow = 3
//print(follow.follow)
//print(follow.$follow)


@propertyWrapper
struct Capitalized3 {
    // MARK: - Properties
    private var value: String
    // MARK: -
    var projectedValue = false
    var wrappedValue: String {
        get {
            value + "x"
        }
        set {
            value = newValue.capitalized
            print(value)
            projectedValue = (newValue.count >= 2 && newValue.count <= 32) ? true : false
        }
    }
    // MARK: - Initialization
    init(wrappedValue: String) {
        value = wrappedValue.capitalized
    }
}
class NewBook {
    @Capitalized3 var author: String
    @Capitalized3 var title: String
    
    init(author: String, title: String) {
        self.author = author
        self.title = title
    }
}
//var newbook = NewBook(author: "f", title: "a great book2")
//print(newbook.author)
//print(newbook.$author)
//newbook.author.append("z studio")
//print(newbook.author)
//print(newbook.$author)
//newbook.author.append("hhhhh")
//print(newbook.author)
//print(newbook.$author)


//MARK:- khác với 2 ví dụ trên lần này number đã có giá trị khởi tạo sẵn là number = 0 nên sẽ chạy set trước
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12"
