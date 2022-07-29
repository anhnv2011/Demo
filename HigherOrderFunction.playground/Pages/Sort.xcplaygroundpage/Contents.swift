//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
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
