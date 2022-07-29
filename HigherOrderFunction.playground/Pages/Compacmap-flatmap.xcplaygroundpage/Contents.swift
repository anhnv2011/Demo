//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/*nhận 1 nonoptinal array  từ 1 optional*/
let stringValues = ["1", "2", "ba", "4", "nam"]

//c1
var soInt = stringValues.compactMap { (soint) -> Int? in
    Int(soint)
}
//c2
var soInt2 = stringValues.compactMap({
                                        Int($0)
})
soInt2


/*nhận 1 single level collection khi bieens dooi 1 chuoi */

let group = [[1,3,4,5], [4,6]]
group.count

var num2 = group.flatMap {
    $0
}
num2
let exampleList = [1, 2, 3, 4, 5]
let exampleList2 = exampleList.flatMap { number -> String in
    "\(number)"
}
print(exampleList)
print(exampleList2)
