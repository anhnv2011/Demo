//
//  Animal.swift
//  DemoSwift_Day04
//
//  Created by Thien Tung on 07/06/2022.
//

import Foundation

// MARK: Structure

// Khai báo struct Animal
struct Animal {
    // Khai báo các thuộc tính
    var name: String = ""
    var legs: Int = 4
    
    // Khởi tạo không có giá trị ban đầu
//    init() {
//        
//    }
    
    // Struct không yêu cầu khởi tạo có giá trị ban đầu
    
    // Methods
    func getLegs() -> Int {
        return self.legs
    }
    
    func showInfor() {
        print("\(self.name) has \(self.legs) legs.")
    }
    
}
