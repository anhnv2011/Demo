//
//  main.swift
//  D4-Struct-class
//
//  Created by MAC on 6/13/22.
//

import Foundation

print("Hello, World!")

var user:User

user = User(id: "a01", name: "aaa", age: 20)

print(user.getYearOfBirth(age: user.age!))
print (user.shoWtName())

var dog = Animal(name: "aaaa", leg: 4)
print(dog.getLeg())
print(dog.showInfor())

// khac nhau giua clas va struc
var person1:User? = User(id: "p1", name: "van a", age: 10)
print(person1!)
var persson2:User? = person1
persson2?.name = "vvv"
print(person1?.name! )
print(persson2?.name!)

person1 = nil
persson2 = nil


//var person3 = User(id: "p3", name: "bbb", age: 12)




var arrNV = [Employee]()

func appendEmployee() {
    // Nhập thông tin của 1 nhân viên
    var employ = Employee()
    print("Nhập tên nhân viên: ", terminator: "")
    employ.name = readLine() ?? "Unknown"
    print("Nhập tuổi nhân viên: ", terminator: "")
    employ.age = Int(readLine() ?? "") ?? 0
    print("Nhập địa chỉ: ", terminator: "")
    employ.address = readLine() ?? ""
    print("Nhập số ngày công: ", terminator: "")
    employ.workdays = Float(readLine() ?? "") ?? 0
    print("Nhập lương 1 ngày: ", terminator: "")
    employ.wage = Float(readLine() ?? "") ?? 0
    // Thêm nhân viên đó vào mảng
    arrNV.append(employ)
}

// C1: Nhập vào n nhân viên
print("Nhập số nhân viên: ", terminator: "")
let number = Int(readLine() ?? "") ?? 0
for i in 0..<number {
    print("Nhập thông tin nhân viên thứ \(i+1):")
    appendEmployee()
}

// C2: In ra ds Nhan vien
for i in 0..<number {
    print("Thông tin NV số \(i+1)")
    arrNV[i].showInfor()
}

// C3: In ra những NV Có địa chỉ HN
func search(){
    for i in arrNV {
        if i.address == "HN" {
            print(i.name)
        }
    }
}

// C4: Cập nhật theo tên
func update(oldname: String, newName: String){
    for i in 0..<arrNV.count {
        if arrNV[i].name == oldname {
            arrNV[i].name = newName
        }
    }
}


// C5: Sắp xếp danh sách nhân viên theo thứ tự giảm dần lương.
func sortBySalary() {
    // Sắp xếp tăng dần
    let arrSortUp = arrNV.sorted { item1, item2 in
        item2.salary() > item1.salary()
    }
    print("Mảng lương tăng dần: ")
    print(arrSortUp)
    // Sắp xếp giảm dần
    let arrSortDown = arrNV.sorted(by: { $0.salary() < $1.salary() })
    print("Mảng lương giảm dần: ")
    print(arrSortDown)
}

// C6: Sắp xếp danh sách nhân viên theo thứ tự tuổi tăng dần.
