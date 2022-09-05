//
//  GroupTimingViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class GroupTimingViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        group()
    }


    func group(){
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 4
        groupAnimation.fillMode = .forwards

//        Animation scale
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = 3.5
        scale.toValue = 1.0

//        Animation rotate
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = 0.0
        rotate.toValue = CGFloat.pi

//        Animation fade-in
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 0.0
        fade.toValue = 1.0


        groupAnimation.animations = [scale, rotate, fade]
        
        //nang cao, ko cos cungduoc
        groupAnimation.repeatCount = 4.0
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        groupAnimation.speed = 2.0


        
        imageView.layer.add(groupAnimation, forKey: nil)
        


//        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
//        animation.fromValue = 0 // start point
//        animation.toValue = CGFloat.pi * 2
//        animation.duration = 3
//        animation.repeatDuration = .infinity
//        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut) //kiểu hiệu ứng
//        imageView.layer.add(animation, forKey: nil)
    }

}
