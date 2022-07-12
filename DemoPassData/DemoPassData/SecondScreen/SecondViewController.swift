//
//  SecondViewController.swift
//  DemoPassData
//
//  Created by MAC on 6/21/22.
//

import UIKit

//phuong thuc dung de viewB uy quyen cho viewA thuc hien 1 hanh dong nao do
protocol PassDataDelagate : AnyObject {
    func logout()
    func updateUserName(username: String)
}

class SecondViewController: UIViewController {
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //cach 1
    //tao 1 bien de hung du lieu truyen sang
    var username: String?
    var password: String?
    
    //c2 dung protocol
    //luon dung weak var
    weak var delegate:PassDataDelagate?
    
    
    //cach 3: closure
    var handlerLogout: ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextfield.text = username
        passwordTextField.text = password
        
    }


    @IBAction func actionLogout(_ sender: UIButton) {
        if usernameTextfield.text != username {
            //goi uy quyen cho view 1 cap nha username
            delegate?.updateUserName(username: usernameTextfield.text!)
        } else {
            //logout: xoa het noi dung text field
            //delegate?.logout()
            handlerLogout?("Logout")
        }
        
        dismiss(animated: true, completion: nil)
    }
    

}
