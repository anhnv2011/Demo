//
//  ValidateViewController.swift
//  DemoValidateTextField
//
//  Created by MAC on 7/12/22.
//

import UIKit

class ValidateViewController: UIViewController {

    @IBOutlet weak var validateNameTxtFld: UITextField!
    @IBOutlet weak var validateEmailTxtFld: UITextField!
    @IBOutlet weak var validatePasswordTxtFld: UITextField!
    @IBOutlet weak var validatePhoneTxtFld: UITextField!
    
    var validation = Validation()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    

    @IBAction func validateBtn(_ sender: UIButton) {
        guard let name = validateNameTxtFld.text, let email = validateEmailTxtFld.text, let password = validatePasswordTxtFld.text,
             let phone = validatePhoneTxtFld.text else {
                return
             }
             let isValidateName = self.validation.validateName(name: name)
             if (isValidateName == false) {
                print("Incorrect Name")
                return
             }
             let isValidateEmail = self.validation.validateEmailId(emailID: email)
             if (isValidateEmail == false) {
                print("Incorrect Email")
                return
             }
             let isValidatePass = self.validation.validatePassword(password: password)
             if (isValidatePass == false) {
                print("Incorrect Pass")
                return
             }
             let isValidatePhone = self.validation.validaPhoneNumber(phoneNumber: phone)
             if (isValidatePhone == false) {
                print("Incorrect Phone")
                return
             }
             if (isValidateName == true || isValidateEmail == true || isValidatePass == true || isValidatePhone == true) {
                print("All fields are correct")
             }
          
    }
    
}
