//
//  Functions.swift
//  PracticeDay03
//
//  Created by Thien Tung on 04/06/2022.
//

import Foundation

/*
Bài 1: Nhập vào chiều dài, chiều rộng. Vẽ hình chữ nhật có chiều dài, rộng đó bằng kí tự "*".
// Hình chữ nhật đặc
************
************
************
************
// Hình chữ nhật rỗng
 ************
 *          *
 *          *
 ************
*/

func veHCN(kiemTraDac: Bool) {
    print("Nhập vào chiều dài: ", terminator: "")
    let dai = Int(readLine() ?? "0") ?? 0
    print("Nhập vào chiều rong: ", terminator: "")
    let rong = Int(readLine() ?? "0") ?? 0
    
    for r in 0..<rong {
        for d in 0..<dai {
            if r == 0 || r == rong-1 || d == 0 || d == dai-1 {
                // Xác định các viền của hình chữ nhật
                print("*", terminator: "")
            } else {
                // Các điểm bên trong hcn (không phải viền)
                if kiemTraDac { // == true
                    // Nếu hcn đặc thì dùng dấu *, rỗng thì dùng dấu space
                    print("*", terminator: "")
                } else {
                    print(" ", terminator: "")
                }
            }
        }
        print()
    }
}
/*
Bài 2: Nhập vào chiều cao h. Vẽ tam giác vuông cân ứng với chiều cao đó
*
**
***
****
*****
******
*/

func veTamGiacVuongCan() {
    print("Nhập chiều cao h của tam giác: ", terminator: "")
    let h = Int(readLine() ?? "0") ?? 0
    // Vòng for thứ nhất để print từng hàng từ dòng 1 đến dòng cuối cùng
    for i in 1...h {
        // Có thể dùng for
//        for j in 0..<i {
//            print("*", terminator: "")
//        }
        var j = 0
        while j < i {
            // Print mỗi dòng có số dấu * tương ứng
            print("*", terminator: "")
            j += 1
        }
        // Xuống dòng khi xong 1 dòng
        print()
    }
}

/*
 Bài 3: Nhập vào 1 năm bất kì. Kiểm tra xem năm đó phải năm nhuận không. (Năm nhuận là năm chia hết cho 400 hoặc vừa chia hết cho 4 vừa không chia hết 100).
 */
func kiemTraNamNhuan(year: Int) -> Bool {
    if year % 400 == 0 { // Kiểm tra chia hết cho 400
        return true
    } else if year % 4 == 0 && year % 100 != 0 { // Kiểm tra chia hết cho 4 và k chia hết cho 100
        return true
    } else {
        return false
    }
}

/*
 Bài 4: Nhập vào giờ, phút, giây từ bàn phím. Nhập vào X giây, sau khi cộng thêm X giây thì giờ mới là bao nhiêu?
 
 Input: Nhập h, m, s, X => đổi hết về giây rồi cộng X vào.
 Từ tổng đó đổi h, m, s
 */
func congThemGiay() {
    print("Nhập giờ: ", terminator: "")
    let h = Int(readLine() ?? "0") ?? 0
    print("Nhập phút: ", terminator: "")
    let m = Int(readLine() ?? "0") ?? 0
    print("Nhập giây: ", terminator: "")
    let s = Int(readLine() ?? "0") ?? 0
    print("Nhập số giây cộng thêm: ", terminator: "")
    let x = Int(readLine() ?? "0") ?? 0
    
    // Đổi tất cả ra giây và cộng thêm X giây
    var totalSeconds = h*3600 + m*60 + s + x
    // Đổi về giờ
    var hours = totalSeconds/3600
    totalSeconds -= hours*3600
    if hours >= 24 {
        hours -= 24
    }
    print("Hour: \(hours)")
    // Đổi về phút
    let mins = totalSeconds / 60
    print("Min: \(mins)")
    totalSeconds -= 60*mins
    // Đổi về giây
    let seconds = totalSeconds
    print("Second: \(seconds)")
}

/*
 Bài 6: Nhập vào 1 mảng số. Tìm số lớn nhất, số nhỏ nhất, và tính trung bình cộng của dãy số đó. Giới hạn 5 chữ số
 Input: 1234 / 1000 = 1
        234 / 100 = 2
        34 / 10 = 3
        4

 Dùng các phép toán: / và % để tách thành các chữ số
[1,2,3,4] => tìm số lớn thứ 2
 */

func inRaSoMax2(number: Int) -> Int {
    var t = number
    var arrTemp = [Int]()
    // Tính số đầu tiên
    let a = t/10000
    arrTemp.append(a)
    // Số thứ 2
    t -= a*10000
    let b = t/1000
    arrTemp.append(b)
    // Số thứ 3
    t -= b*1000
    let c = t/100
    arrTemp.append(c)
    // Số thứ 4
    t -= c*100
    let d = t/10
    arrTemp.append(d)
    // Số thứ 5
    arrTemp.append(t-d*10)
    print(arrTemp)
    
    // Remove đi số lớn nhất trong mảng
    // Lấy ra số max trong mảng
    let max = arrTemp.max()
    // Xoá đi phần tử lớn nhất
    arrTemp.removeAll { item in
        item == max
    }
    // Phần tử lớn nhất sau khi xoá sẽ là số lớn thứ 2
    print(arrTemp.max() ?? -1)
    return arrTemp.max() ?? -1
    // Sắp xếp tăng dần mảng các số
//    let arrSorted = arrTemp.sorted()
//    var j = arrSorted.count-2
//    while j >= 0 {
//        if arrSorted[j] != arrSorted[j+1] {
//            return arrSorted[j]
//            // Sau return các câu lệnh k được thực hiện
//        }
//        print(j, arrSorted[j])
//        j -= 1
//    }

}

/* Bài 8: Nhập vào 1 số nguyên, in ra danh sách các ước của số đó. (Ước là các số mà số đó chia hết.)
 */
func timUoc(number: Int) -> [Int] {
    // Tạo mảng chứa các ước
    var arrUoc = [Int]()
    // Duyệt từ 2 đến căn bậc 2 của number
    for i in 2...Int(number/2)+1 {
        if number % i == 0 {
            // Nếu chia hết thì là ước => thêm vào mảng
            arrUoc.append(i)
        }
    }
    // Trả về mảng ước của number
    return arrUoc
}

/*
 Bài 9: Viết chương trình hiện trắc nghiệm 4 đáp án. Cho người dùng nhập đáp án A,B,C,D rồi in ra kết quả (Đúng/Sai).
 */

func tracNghiem() {
    print("Đâu không phải là ngôn ngữ lập trình: ")
    print("A: Swift")
    print("B: Python")
    print("C: C#")
    print("D: HTML")
    var dapAn = ""
    repeat {
        print("Nhập đáp án của bạn: ", terminator: "")
        dapAn = readLine() ?? ""
    } while dapAn == "" || (dapAn != "A" && dapAn != "B" && dapAn != "C" && dapAn != "D")
    
    switch dapAn {
    case "A", "B", "C":
        print("Đáp án sai")
    case "D":
        print("Đáp án đúng")
    default:
        break
    }
}
