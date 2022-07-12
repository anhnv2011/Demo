//
//  main.swift
//  WhileDoTutorial
//
//  Created by Thien Tung on 04/06/2022.
//

import Foundation

var i = 10
var j = 0

// Xét điều kiện rồi mới thực hiện
while j < i { // Khi nào j còn nhỏ hơn i thì thực hiện khối lệnh
    print(j)
    j += 2
    if j > 5 {
        break // Break để dừng và thoát khỏi vòng lặp
    }
}

print("Done")

// Thực hiện trước rồi mới xét điều kiện: Nên sẽ thực hiện khối lệnh ít nhất 1 lần.
repeat {
    // Trong repeat là khối lệnh cần thực hiện
    print(j)
    print("Abc")
} while 3 > 5
print("Done repeat")

// Example: Check điều kiện nhập vào
// Cần nhập vào 1 số 0 < x < 1000
var x: Int
repeat {
    print("Nhập vào số x: ", terminator: "")
    x = Int(readLine() ?? "0") ?? 0
} while (x <= 0 || x >= 1000)
          
            // Dùng while để truy xuất đến các phần tử trong mảng theo index
let arrNumbers = [1,8,9,6,1,456,16]
var k = 0
while k < arrNumbers.count {
    print(arrNumbers[k])
    k+=1
}
