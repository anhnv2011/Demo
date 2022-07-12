//
//  FirstViewController.swift
//  DemoPassData
//
//  Created by MAC on 6/21/22.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }

    @IBAction func actionLogin(_ sender: UIButton) {
        if let username = userNameTextField.text,
           let password = passwordTextField.text,
           username.count > 0,
           password.count > 0
           {
            let secondVC = SecondViewController()
            secondVC.modalPresentationStyle = .fullScreen
            // truyen du lieu, chi truyen tu man khoi toa truoc sang mang khoi tao sau
            
            secondVC.username = username
            secondVC.password = password
            
            //gan su uy quyen cua view 2 cho view 1
            secondVC.delegate = self
            
            secondVC.handlerLogout = { result in
                print(result)
                self.userNameTextField.text = ""
                self.passwordTextField.text = ""
            }
            
            present(secondVC, animated: true, completion: nil)
        } else {
            
            let alertVC = UIAlertController(title: "Error", message: "Nhap day du thong tin", preferredStyle: .alert)
            
            let actionDone = UIAlertAction (title: "ok", style: .default) { (_) in
                print("done")
            }
            let actionCancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            //so luong atiocn co the ad toi da la 2
            alertVC.addAction(actionDone)
            alertVC.addAction(actionCancel)
            
        
            present(alertVC, animated: true, completion: nil)
        }
       
    }
    
   
}

//ke thua phuong thuc passdatadelgate cho firsviewcontroller
extension FirstViewController:PassDataDelagate {
    func logout() {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func updateUserName(username: String) {
        userNameTextField.text = username
    }
    
    
}
