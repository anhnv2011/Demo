//
//  DemoCoreAnimationViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class DemoCoreAnimationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.layer.cornerRadius = 100
//        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.rotateImage()
            self?.animateRadius()
        }
    }

    
    @IBAction func Login(_ sender: UIButton) {
        let email = emailTextfield.text ?? ""
        let password = passwordTextfield.text ?? ""
        
        guard validateEmailId(emailID: email) else {
            shakeField(emailTextfield)
            return
        }
        guard validatePass(pass: password) else {
            shakeField(passwordTextfield)
            return
        }
        print("succes login")
    }
    
    func shakeField(_ textfield: UITextField){
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [0, 10, -10 , 10 , 0]
        animation.keyTimes = [0, 0.1, 0.25, 0.4, 0.5]
        animation.duration = 0.5
        
        //khi animation chạy xong nó sẽ xoá khỏi layer và trở lại vị trí ban đầu, nên muốn nó giữ lại vị trí với animation mới
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        textfield.layer.add(animation, forKey: nil)
        
    }
    func rotateImage(){
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0 // start point
        animation.toValue = CGFloat.pi * 2
        animation.duration = 3
        animation.repeatDuration = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut) //kiểu hiệu ứng
        imageView.layer.add(animation, forKey: nil)
        
    }
    func animateRadius(){
//        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse]) {
//            self.imageView.layer.cornerRadius = 100
//        } completion: { _ in
//
//        }
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0 // start point
        animation.toValue = 100
        animation.duration = 3
        animation.autoreverses = true
        animation.repeatDuration = .infinity
        imageView.layer.add(animation, forKey: nil)

    }
     func validateEmailId(emailID: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
       let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       let isValidateEmail = validateEmail.evaluate(with: trimmedString)
       return isValidateEmail
    }
     func validatePass(pass: String) -> Bool {
        return pass.count > 5
    }
}
