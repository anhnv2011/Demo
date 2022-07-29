//: [Previous](@previous)

import Foundation

//var str = "Hello, playground"
//
///* do c sang f */
//let doc:[String: Double] = ["Spring": 13, "Sumner": 22, "Fall": 10, "Winter": 4 ]
/////c1
//var doF = doc.map { (season, temp) -> (String, Double) in
//    (season, temp*9/5+32)
//}
//print(doF)
//
/////c2
//var dof2 = doc.map { (season, temp)  in
//    (season, temp*9/5+32)
//}
//
/////c3
//
//var dof3 = doc.map { ($0, $1*9/5+32)
//}

/* convert dic to array */
let dataDict: [String:Int] = ["anh": 12,"nguyen": 13,"viet": 19]

struct User {
    var name: String
    var age: Int
}
//var user = dataDict.map { (key, value) -> User in
//    User(name: key, age: value)
//}

var user2 = dataDict.map {
    User(name: $0.key, age: $0.value)
}
var user3 = dataDict.map({
    User(name: $0, age: $1)
})
user3

/* Set */
// Chuyển sang độ C
let farh:Set = [-30,2,44,55,33]
// cel la kieu array
let cel = farh.map {
    ($0-32)*5/9
}
//cel van la set
let cel2 = Set(farh.map {
    ($0-32)*5/9
})
