//
//  extension.swift
//  DemoAudioPlayer
//
//  Created by MAC on 6/23/22.
//


import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func circle(){
        let corner = min(self.bounds.width, self.bounds.height)
        self.clipsToBounds = true
        self.layer.cornerRadius = corner/2
    }
}

extension Int {
    func asString() -> String {
        let hour = self / 3600
        let minute = (self % 3600) / 60
        let second = (self % 3600) % 60
        
        var hourString = "\(hour)"
        var minuteString = "\(minute)"
        var secondString = "\(second)"
        
        if hour < 10 {
            hourString = "0\(hour)"
        }
        
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        if second < 10 {
            secondString = "0\(second)"
        }
        
        if hour == 0 {
            return minuteString + ":" + secondString
        } else {
            return hourString + ":" + minuteString + ":" + secondString
        }
    }
}
extension UIViewController {
    func showAlert(title: String, message: String, titleLeft: String, leftAction: @escaping(() -> Void), rightTitle: String, rightAction: @escaping(() -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: titleLeft, style: .default, handler: { _ in
            leftAction()
        }))
        alert.addAction(UIAlertAction(title: titleLeft, style: .default, handler: { _ in
            rightAction()
        }))
        alert.addAction(UIAlertAction(title: titleLeft, style: .default, handler: { (<#UIAlertAction#>) in
            <#code#>
        }))
        present(alert, animated: true)
    }
}
