//
//  ViewController.swift
//  DemoUserDefault
//
//  Created by MAC on 7/28/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userTextField: UITextField!
    
    let keySave = "username"
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.text = UserDefaults.standard.string(forKey: keySave)
        
    }

    @IBAction func actionSave(_ sender: Any) {
        
        //lưu dữ liệu vào bộ nhớ
        // lưu theo key value
        // không có phương thức xoá nên chúng ta phải set về nil
        //sửa thì ghi đè
        
        UserDefaults.standard.setValue(userTextField.text, forKey: keySave)
        UserDefaults.standard.synchronize()
    }
    
}

