//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: DE loc nhung  ket qua match voi yeu cau
let numbers = [1,2,3,4,5,6,7,8,9,10]

//dung loop
var newnumbers = [Int]()
for i in numbers {
    i <= 5 ? newnumbers.append(i) : nil
}
newnumbers

//use filter
var newnumber2 = numbers.filter { (number) -> Bool in
    number <= 5
}
newnumber2

// shorthand

var newnumber3 = numbers.filter{ $0<=5}
newnumber3



/*voi string*/

//loc ra bat dau bang "a" hay "A"
let names = ["anh", "basdasd","Asda", "ccccc","anh1", "anh2", "Ad", "vbcvb", "sdf"]
var newNames = names.filter { (name) -> Bool in
    name.first == "a" || name.first == "A"
}
newNames

var newName2 = names.filter({$0.uppercased().hasPrefix("A")}).first //lay duy nhat cai dau
newName2


/*Với object*/
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

//lon hơn 18

var user2 = user.filter { (user) -> Bool in
    user.age > 18
}
user2
//shorthan
var user3 = user.filter({
    $0.age > 18
})


// get array of people older than 18 va bat dau bang "v"
var user4 = user.filter { (user) -> Bool in
    user.age>18 && user.name.hasPrefix("V")
}
user4

//combine filter with map lay array ten > 18
var user5 = user.filter({$0.age > 18}).map{$0.name}
user5


/*Với dic*/
let dataDict: [String:Int] = ["anh": 12,"nguyen": 13,"viet": 19]
var dic = dataDict.filter { (dict) -> Bool in
    dict.value > 18
}
dic

var dic2 = dataDict.filter { $0.value > 18}

/*Với set */
let weight : Set = [12.12, 13.13, 14.14, 15.15, 15.16]
var neww = weight.filter{ $0 > 13}
neww



//: [Next](@next)
var numbers4 = [1,2,3,4,5,6]
numbers4.removeAll()

var numbers2 = [1,2,3,4,5,6]
numbers2.removeAll { (number) -> Bool in
    number > 4
}
numbers2

var numbers3 = [1,2,3,4,5,6]
numbers3.removeAll{ $0 > 4 }
numbers3
