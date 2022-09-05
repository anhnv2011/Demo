//
//  CASpringAnimationViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class CASpringAnimationViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.caspringAnimation()
        })
       
    }
    /*
     damping: thể hiện cho ma sát không khí, damping càng lớn thì dao động tắt dần càng nhanh và ngược lại.
     mass: thể hiện cho khối lượng của con lắc, giá trị mặc định là 1.0. Mass càng lớn thì biên độ dao động càng ngắn và ngược lại.
     stiffness: thể hiện cho độ cứng lò xo con lắc, stiffness càng lớn thì dao động tắt dần càng nhanh và ngược lại.
     initialVelocity: tốc độ khi bắt đầu animation, giá trị mặc định là 0.0, giá trị dương: hướng di chuyển khi bắt đầu sẽ là về phải điểm cân bằng, giá trị âm: hướng di chuyển khi bắt đầu sẽ là ra xa điểm cân bằng. Giá trị initialVelocity càng lớn thì lo xo càng có nhiều năng lượng, dao động càng lâu và ngược lại.
     */
    
    func caspringAnimation(){
        
        let jump = CASpringAnimation(keyPath: "position.x")
        jump.fromValue = imageView.layer.position.x + 200
        jump.toValue = imageView.layer.position.x 
        jump.duration = 4
        imageView.layer.add(jump, forKey: nil)
        jump.damping = 0.1
        jump.mass = 0.5
        jump.stiffness = 0.5
        jump.initialVelocity = 1
        jump.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        imageView.layer.layoutIfNeeded()
        
        
    }
    
}
