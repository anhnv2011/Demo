//
//  User.swift
//  DemoSwift_Day04
//
//  Created by Thien Tung on 07/06/2022.
//

import Foundation
// MARK: Class user
// Khai báo: class User
class User {
    // Khai báo các thuộc tính trong class User
    var id: String?
    var name: String!
    var age: Int?
    
    // Trong class, khi khởi tạo thì các thuộc tính phải có giá trị
    // Khởi tạo không giá trị
    init () {
        
    }
    
    // Khởi tạo giá trị ban đầu
    init (ma: String, ten: String, tuoi: Int) {
        self.id = ma
        self.name = ten
        self.age = tuoi
    }
    
    // Methods: Các phương thức: chính là các hàm (func) nhưng nó viết riêng sử dụng trong đối tượng class
    func getYearOfBirth() -> Int {
        return 2022-self.age!
    }
    
    func showName() {
        print("Tên là: \(self.name ?? "No name")")
    }
    
    
    // Chỉ class có
    deinit {
        // Hàm sẽ được gọi khi đối tượng class không được sử dụng nữa (không có đối tượng trỏ đến, ...)
        // -> Giải phóng trả lại bộ nhớ
        print("\(self.name) deinit")
    }
    
}
