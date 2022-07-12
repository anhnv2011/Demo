//
//  main.swift
//  PracticeStructure
//
//  Created by Thien Tung on 07/06/2022.
//

import Foundation


// Khởi tạo 1 mảng nhân viên
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
print()
print("DS NV ở HN:")
for item in arrNV {
    if item.address == "HN" {
        item.showInfor()
    }
}
// C4: Cập nhật theo tên
func updateBy(oldName: String, newName: String) {
    print("Sửa thông tin ")
    for i in 0..<arrNV.count {
        if arrNV[i].name == oldName {
            arrNV[i].name = newName
        }
    }
}

updateBy(oldName: "Tung", newName: "Thien")
for item in arrNV {
    item.showInfor()
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
