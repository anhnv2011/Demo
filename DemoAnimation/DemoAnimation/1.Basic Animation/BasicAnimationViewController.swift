//
//  BasicAnimationViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class BasicAnimationViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var topButtonTopConstraint: NSLayoutConstraint!
    
    var isShow = false
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topButtonTopConstraint.constant =  -(alertView.frame.origin.y) - alertView.frame.height
        
        transformScale()
        transformRotate()
    }

    @IBAction func runAnimation(_ sender: UIButton) {
        //uiviewAnimate(show: isShow)
        springAnimate(show: isShow)
    }
    
    func uiviewAnimate(show: Bool){
        UIView.animate(withDuration: 0.6) { [weak self] in
            if show {
                self?.isShow.toggle()
                self?.hideButton()
                
            } else {
                self?.isShow.toggle()
                self?.showButton()
                
            }
            self?.view.layoutIfNeeded()
        }
        
    }
    
    func springAnimate(show: Bool){
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.6, // giá trị càng gần 0 sẽ tạo ra dao động càng mạnh.
                       initialSpringVelocity: 4, //tốc độ bắt đầu giao động, cung cấp lực đủ cho animation kéo dài theo duration
                       options: [.curveEaseInOut]) { [weak self] in
            
            if show {
                self?.isShow.toggle()
                self?.hideButton()
                
            } else {
                self?.isShow.toggle()
                self?.showButton()
                
            }
            self?.view.layoutIfNeeded()
            
        } completion: { (success) in
            if success {
                print("comple")
            }
        }

    }
    
    func showButton(){
        topButtonTopConstraint.constant = 40
    }
    func hideButton(){
        topButtonTopConstraint.constant =  -(alertView.frame.origin.y) - alertView.frame.height
    }
    
    
    func transformScale() {
        
        UIView.animate(withDuration: 2,
                               delay: 0,
                               usingSpringWithDamping: 0.1,
                               initialSpringVelocity: 0.0,
                               options: [.repeat],
                               animations: {
                               self.image1.transform = CGAffineTransform(scaleX: 3, y: 3)
                },
                               completion: { (_) in
                })
    }
    
    func transformRotate(){
        UIView.animate(withDuration: 2,
                               delay: 0,
                               usingSpringWithDamping: 0.1,
                               initialSpringVelocity: 0.0,
                               options: [.repeat],
                               animations: {
                                self.image2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                },
                               completion: { (_) in
                })
    }
}
