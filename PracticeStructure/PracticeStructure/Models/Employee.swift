//
//  Employee.swift
//  PracticeStructure
//
//  Created by Thien Tung on 07/06/2022.
//

import Foundation
/*
Employee có các thuộc tính:
- ID: String
- Name: String
- Age: Int
- Address: String
- Workdays: Float (Số ngày làm việc)
- Wage: Float (Lương 1 ngày)
- Salary: Float (Tổng lương)
 * Constructor (class)
 * Phương thức tính lương: workday*wage
*/

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
