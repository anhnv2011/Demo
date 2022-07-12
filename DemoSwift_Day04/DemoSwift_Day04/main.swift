//
//  main.swift
//  DemoSwift_Day04
//
//  Created by Thien Tung on 07/06/2022.
//

import Foundation

//// Khai báo biến optional
//var number: Int? // Biến number có thể mang giá trị nil
//print("Number is: ", number)
//
//var name: String! = "Tech" // Biến name khi sử dụng bắt buộc không được nil, nếu nil => crash
//print("Name is: ", name)
//
//var age: Int = 20 // Biến age là kiểu non-optional => không thể mang giá trị nil
////age = nil
//print(age)
//
//// Unwrap Optional
//// C1: Cung cấp giá trị mặc định nếu biến nil
//print("Number: \(number ?? 10)")
//// C2: Dùng ! ở sau biến: Phải chắc chắn được là biến không bị nil, nếu nil => crash chương trình
////print(number!) // Crash
//
//// C3: Dùng if let hoặc guard let để unwrap.
//// Dùng if let
////number = 15
//if let n = number { // Nếu number k bị nil thì gán vào hằng số n, n là kiểu non-optional
//    print("N is: \(n)")
//} else { // Nếu number nil => xuống else
//    print("Number is nil!!!")
//}
//
//func checkGuard() {
//    // Dùng guard let
//    guard let num = number else { // num là kiểu non-optional (không thể mang giá trị nil)
//        // nếu number nil thì thực hiện trong else
//        // nếu không nil thì gán num = number, thực hiện tiếp đoạn code sau guard
//        print("Num is nil, no data!!!")
//        return
//    }
//    print("Num is not nil: \(num)")
//}
//checkGuard()

// MARK: Class

// Khởi tạo có tham số truyền vào
var user1: User
user1 = User(ma: "U01", ten: "Nguyen Van A", tuoi: 22)
print("Name 1 is: ", user1.name!)

var user2 = User(ma: "U02", ten: "Le Thi B", tuoi: 30)
print("Age 2 is: ", user2.age ?? 2)
user2.age = 33
print("Age 2 is: ", user2.age ?? 2)

// Khởi tạo không tham số truyền vào
var user3 = User()
print("Name 3 is: ", user3.name ?? "Unknown")
// Gán giá trị vào thuộc tính name
user3.name = "Hoang Van C"
print("Name 3 is: ", user3.name ?? "Unknown")

// Dùng phương thức của class
user1.showName()
print("Năm sinh của \(user1.name!) là: ", user1.getYearOfBirth())

// MARK: Struct
var dog: Animal = Animal()
print(dog.getLegs())
dog.name = "Dogs"
dog.showInfor()

var cat = Animal(name: "Cat", legs: 4)
cat.showInfor()

// MARK: Sự khác nhau khi dùng Class và Struct
//class
var person1: User? = User(ma: "P1", ten: "John", tuoi: 30)
print("P1 has name: \(person1?.name!)")
var person2: User? = person1
person2?.name = "Shainline"
print("P2 has name: \(person2?.name!)")
print("P1 has name: \(person1?.name!)")

person2 = nil
person1 = nil

// Struct
let bird = Animal(name: "Bird", legs: 2)
bird.showInfor()
var fish = bird
fish.legs = 0
fish.name = "Fish"
bird.showInfor()
fish.showInfor()

