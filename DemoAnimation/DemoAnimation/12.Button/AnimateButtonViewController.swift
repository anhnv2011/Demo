//
//  AnimateButtonViewController.swift
//  DemoAnimation
//
//  Created by MAC on 7/30/22.
//

import UIKit

class AnimateButtonViewController: UIViewController {

    @IBOutlet weak var button2WidthConstraints: NSLayoutConstraint!
    @IBOutlet weak var button1Constraint: NSLayoutConstraint!
    @IBOutlet weak var button2: UIButton!
    
    
    @IBOutlet weak var more: UIButton!
    @IBOutlet weak var shuffle: UIButton!
    @IBOutlet weak var repeatB: UIButton!
    @IBOutlet weak var like: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1Constraint.constant -= 1000
        print( button1Constraint.constant)
       
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.button1Constraint.constant += 1000
            self.view.layoutIfNeeded()
            print( self.button1Constraint.constant)
        } completion: { _ in
        }

    }
  
    @IBAction func clickButton2(_ sender: UIButton) {
      
//        UIView.animate(withDuration: 12, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut) {
//            //self.button2WidthConstraints.constant = self.button2.bounds.height
//            self.button2WidthConstraints.constant += 120
//        } completion: { sucess in
//            if sucess {
//                UIView.animate(withDuration: 1) {
//                    self.button2WidthConstraints.constant -= 60
//                }
//            }
//        }
//
//
        
       
        let bounds = sender.bounds
       
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut) {
            sender.bounds = CGRect(x: bounds.origin.x - 30, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
        } completion: { (success) in
            if success {
                UIView.animate(withDuration: 0.5) {
                    sender.bounds  = bounds
                }
            }
        }
    }
    
    
    
    @IBAction func moreClick(_ sender: UIButton) {
    }
    
    
    
    
}
