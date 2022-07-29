//: [Previous](@previous)

import Foundation

let numbers = [1,2,3,4,5,6]
// yêu cầu trả về 1 mảng số x2

///c1: dung loop
var doubleNumber:[Int] = []
for number in numbers {
    doubleNumber.append(number*2)
}

///c2: dung map
var doubleNumberMap = numbers.map { (number) -> Int in
    return number*2
}

///c3
var doubleNumberMap2 = numbers.map { (number) in
    return number*2
}
/// c4: in singline closure we can omit (bo) return
var doubleNumberMap3 = numbers.map { numbers in
    numbers*2
}

///c5
var doubleNumberMap4 = numbers.map { $0*2}
doubleNumberMap4


/* sum*/
let pair = [[1,3], [5,7], [4,6]]

var sums = pair.map { sum in
    sum[0] + sum[1]
}
sums

var sum3 = pair.map { (sum) -> Int in
    sum[0] + sum[1]
}

var sum2 = pair.map { $0[0] + $0[1]
    
}
sum2

/* sum mảng khác số phần tử*/

let group = [[1,3,4,5], [4,6]]
var groupSum = group.map { (groupSum) -> Int in
    var sum = 0
    for number in groupSum {
        sum += number
    }
    return sum
}
groupSum

/* mảng cos nhieu type, muon convert sang int neu duoc*/
let stringValues = ["1", "2", "ba", "4", "nam"]
///c1
var numberconvert = stringValues.map { (number) -> Int? in
    Int(number)
}
///c2
var numberconvert2 = stringValues.map { (number) -> Int in
    (Int(number) ?? -1)
    
}

/* Lay ten tu 1 array user */

struct User {
    var name: String
    var age: Int
}
let user:[User] = [
    User(name: "Anh", age: 18),
    User(name: "nguyen", age: 28),
    User(name: "Viet", age: 38)
]

var name = user.map { (user) -> String in
    user.name
}
print(name)
var name2 = user.map { $0.name
}
print(name2)
