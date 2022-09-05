import UIKit
func swap2Value<T>(a:inout T, b:inout T){
    let temp = a
    a = b
    b = temp
}
var string1 = "String 1"
var string2 = "String 2"
swap(&string1, &string2)
print(string1)

struct Stack<T>{
    var item:[T] = []
    mutating func push(a:T){
        item.append(a)
    }
    mutating func pop(){
        item.removeLast()
    }
}

var stackOfString = Stack<String>()
stackOfString.push(a: "sdfsfsf")
stackOfString.push(a: "2")
stackOfString.push(a: "3")


extension Stack {
    var topItem: T?{
        return item.isEmpty ? nil : item[item.count - 1]
    }
}
//demo
if let topItem = stackOfString.topItem {
    print(topItem)
}

//Type Constraint Syntax
/*Cú pháp cho việc sử dụng cho Type Constraint vào các Generic thì cũng trương tự như việc bạn kế thừa hoặc conform một Protocol nào đó cho class/struct của bạn. Và ta sẽ đặt kiểu dữ liệu ràng buộc vào sau tên của Generic và cách nhau bởi dấu :.
*/
class SomeClass {}
protocol SomeProtocol {}
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}

//chạy bình thường
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

//Nhưng nếu viết như ví dụ generic đầu tiên thì sẽ báo lỗi ko biên dịch được, mà khi so sánh kiểu dữ liệu mà mình tự định dạng thì cần comform thêm EquatableValue
func findIndex<T:Equatable>(of valueToFind: T,in array: [T]) -> Int? {
    for (index, value)  in array.enumerated(){
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let intIndex = findIndex(of: 3, in: [1, 2, 3, 4])
let stringIndex = findIndex(of: "3", in: ["2", "3", "4"])
