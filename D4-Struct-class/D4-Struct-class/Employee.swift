//
//  Employee.swift
//  D4-Struct-class
//
//  Created by MAC on 6/13/22.
//

import Foundation

struct Employee {
    // Properties
    var id: String = UUID().uuidString
    // Tự gen ra ID, hàm có sẵn trong swift
    var name: String = ""
    var age: Int = 0
    var address: String = ""
    var workdays: Float = 0
    var wage: Float = 0
    
    //Methods
    func salary() -> Float {
        return workdays*wage
    }
    
    func showInfor() {
        print("ID: \(self.id)")
        print("Name: \(self.name)")
        print("Age: \(self.age)")
        print("Add: \(self.address)")
        print("Days: \(self.workdays)")
        print("Salary: \(self.salary())")
    }
    
    
    
}
