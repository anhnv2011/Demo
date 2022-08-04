//
//  LoginViewController.swift
//  DemoFirebase
//
//  Created by MAC on 8/2/22.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FirebaseCore
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var googleSignin: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        guard let username = userTextfield.text,
              let password = passwordTextField.text else {
            return
        }
        
        var message = ""
        
        
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if let error = error {
                message = "Loi"
                let alert = UIAlertController(title: "thong bao", message: message, preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                print(error.localizedDescription)
            } else {
                //                message = "succese"
                //                let alert = UIAlertController(title: "thong bao", message: message, preferredStyle: .actionSheet)
                //                let action = UIAlertAction(title: "ok", style: .default, handler: nil)
                //                alert.addAction(action)
                //                self.present(alert, animated: true, completion: nil)
                let vc = ProfileViewController()
                print(result)
                self.present(vc, animated: true, completion: nil)
            }
            
            
        }
    }
    
    
    @IBAction func actionSignup(_ sender: UIButton) {
        guard let username = userTextfield.text,
              let password = passwordTextField.text else {
            return
        }
        Auth.auth().createUser(withEmail: username, password: password) { (result, error) in
            if let error = error {
                let message = error.localizedDescription
                let alert = UIAlertController(title: "thong bao", message: message, preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                let message = "user \(username) da dang ki thanh cong"
                let alert = UIAlertController(title: "thong bao", message: message, preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    
    @IBAction func googleSignIn(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [weak self] user, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
            
        }
       
    }
}
