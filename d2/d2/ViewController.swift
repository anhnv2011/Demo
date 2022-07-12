//
//  ViewController.swift
//  d2
//
//  Created by MAC on 6/13/22.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    var user:userStatus?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = .ofline
        print(userStatus.allCases)
        print(userStatus.allCases.first?.rawValue ?? "")
        
        print(user?.rawValue)
        
        
        congThemGiay()
    }

 
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

}

