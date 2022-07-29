//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
/* Contain */
let numbers = [1,2,3,4,5,6]
//kiem tra xem co so 1 so 4 ko
let found = numbers.contains(4)

//kiem tra xem co nhieu so 4 ko
let found2 = numbers.contains{ $0.isMultiple(of: 4) }
found2

struct User {
    var name: String
    var age: Int
}
let user:[User] = [
    User(name: "Anh", age: 18),
    User(name: "nguyen", age: 28),
    User(name: "Viet", age: 38),
    User(name: "Vong", age: 40)
]

var checktuoi = user.contains {$0.age > 50 }
checktuoi



/* for each */
// gioong loop nhung ko phai loop

let numbers2 = [1,2,3,7,5,6]
 //so le chan
numbers2.forEach { (chanle) in
    ((chanle % 2) != 0) ? print("so le") : print("sochan")
}

let numbers3 = [1,2,3,nil,7,5,6,nil]
numbers3.forEach { (number) in
    guard let number = number else {
        print("nil")
        return
    }
    ((number % 2) != 0) ? print("so le") : print("sochan")
}


////in index cua nil trong array
//
//numbers3.enumerated().forEach { (index, number) in
//    guard let number = number else {
//        print("index \(index + 1) la nil")
//        return
//    }
//
//}



/* Sort */
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]


var names2 = names.sorted()
var name3 = names.sorted { (s1, s2) -> Bool in
    s1 > s2
}
name3
var nam4 = names.sorted{
    $0>$1
}
nam4
