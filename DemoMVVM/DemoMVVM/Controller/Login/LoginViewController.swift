//
//  LoginViewController.swift
//  DemoMVVM
//
//  Created by MAC on 8/4/22.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case loginButton:
            tapLogin()
        case registerButton:
            print("")
        default:
            print("")
        }
    }
    
    func tapLogin(){
        
        //C1
        //        viewModel.login(email: emailTextfield.text!, password: passwordTextfield.text!) { (succes) in
        //            if succes {
        //                print("Login succes")
        //            } else {
        //                print("failde")
        //            }
        //        }
        
        
        //c2
        viewModel.login2(email: emailTextfield.text!, password: passwordTextfield.text!) { (result) in
            switch result {
            case .success:
                print("succes")
                let scene = UIApplication.shared.connectedScenes.first
                               if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                                   sd.changeScreen(type: .tabbar)
                               }
            case .failure(let bool, let string):
                print("asdasd")
                print(string)
            }
        }
    }
}
