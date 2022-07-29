//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/* Array */
let numbers = [1,2,3,4,5,6]

//sum bang reduce
var sum = numbers.reduce(0) { (sumResult, number) -> Int in
    sumResult + number
}

//
var sum2 = numbers.reduce(0) { $0 + $1
}
var sum3 = numbers.reduce(0,+)

//
var nhan = numbers.reduce(1, *)


let numberGroups = [[2,6,8,10], [18,5,11], [5,15,8,11,18]]

var groupSum = numberGroups.flatMap({$0}).reduce(0, +)
groupSum



/* Struct */

struct Employe {
    var name: String
    var salary: Double
}
var employe:[Employe] = [
    Employe(name: "Anh", salary: 18),
    Employe(name: "nguyen", salary: 28),
    Employe(name: "Viet", salary: 38)
]
// full synctax
var sumSalary = employe.reduce(0) { (sum, employee) -> Double in
    sum + employee.salary
}

// shorthand
var sumSalary2 = employe.reduce(0) { $0 + $1.salary } //$0 la sum, $1 la emplye

var sumname = employe.reduce("a") { (sumname, employe) in
    employe.name > "n" ? sumname + employe.name : sumname
}
sumname

/* Dictionary */
let dataDict: [String:Double] = ["anh": 1200,"nguyen": 1321,"viet": 1912]
//full synctax
var sumDict = dataDict.reduce(0) { (sum, datadic) -> Double in
    sum + datadic.value
}

// short hand

var sumDict2 = dataDict.reduce(0) { $0 + $1.value
}
sumDict2

//dung ket hop voi map
var sumdict3 = dataDict.map {$0.value}.reduce(0, +)
sumdict3

var name = dataDict.reduce("") { (name, datadict) -> String in
    name + datadict.key + " "
}
name



/* Set */

let weight : Set = [12.12, 13.13, 14.14, 15.15, 15.16]

// sum
var sumWeight = weight.reduce(0,+)
sumWeight
var sumweigh2 = weight.reduce(1.0) { (sum, number) in
    if number > 13.13 {
        return sum + number
    } else {
        return sum
    }
}
sumweigh2

//sum nang hon 13
var nang = weight.reduce(0) { (sum, number) -> Double in
    if number > 13.13 {
        return sum + number
    } else {
        return sum
    }
    
}
nang

// Ternary operators

var nang2 = weight.reduce(0) { (sum, number) -> Double in
    number > 13.13 ? sum + number : sum
}
nang2

var nang3 = weight.reduce(0) {
    $1 > 13.13 ? $0 + $1 : $0
}
nang3





