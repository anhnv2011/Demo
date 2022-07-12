//
//  User.swift
//  D4-Struct-class
//
//  Created by MAC on 6/13/22.
//

import Foundation

class User {
    var id:String?
    var name: String!
    var age: Int?
    
    
    
    //trong class khi khoi tao thi cac thuoc tinhs phai cos gia tri
    
    //khoi tao khong gia tri
    init (){
        
    }
    
    init (id:String, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }

    func getYearOfBirth(age: Int) -> Int {
        return 2022 - age
    }
    func shoWtName (){
        print("Ten la:\(self.name ?? "No name")")
    }
    
    //chi class co
    deinit {
        //kho doi tuong class ko duoc su dung nuax thi se duoc giai phong tra lai bo nho cho thiet bi (khong co doi tuong tro den no)
        print("deinit")
    }

}

