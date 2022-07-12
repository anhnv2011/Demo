//
//  Animal.swift
//  D4-Struct-class
//
//  Created by MAC on 6/13/22.
//

import Foundation
struct Animal {
    var name:String = ""
    var leg: Int = 4
//
//    init(){
//        
//    }
    
    func getLeg() -> Int {
        return self.leg
    }
    func showInfor() {
        print("\(self.name) have \(self.leg) leg")
    }
}
