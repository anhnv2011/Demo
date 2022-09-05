//
//  KeyFrameViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class KeyFrameViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        keyframe()
    }


    /*
     relativeStartTime : thời gian tương đối tính theo phần trăm để bắt đầu animation cho keyframe với tổng thời gian diễn ra toàn bộ animation. RelativeStartTime có giá trị 0 -> 1. Ví dụ: relativeStartTime = 0.1 -> animation sẽ bắt đầu sau 10% * tổng thời gian animation.
     relativeDuration : thời gian tương đối tính theo phần trăm diễn ra animation cho keyframes với tổng thời gian diễn ra toàn bộ animation.
     animations : closure chỉ ra animation đối tượng gì.
     
     duration : tổng thời gian diễn ra animation.
     options : một danh sách các tuỳ chọn về cách thức animation.
     animations : closure chỉ ra animation các key frames nào.
     completion : khi animation kết thúc, closure này sẽ được thực thi.

     
     */
    func keyframe(){
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [], animations: {
              //add keyframes
              
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.imageView.center.x += 80.0
                self.imageView.center.y -= 10.0
                self.view.layoutIfNeeded()
              })
              
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4) {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
              }
              
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.imageView.center.x += 100.0
                self.imageView.center.y -= 50.0
                self.imageView.alpha = 0.0
                self.view.layoutIfNeeded()
              }
              
            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                self.imageView.transform = CGAffineTransform.identity
                self.imageView.center = CGPoint(x: 0.0, y: self.view.center.y)
                self.view.layoutIfNeeded()
              }
              
            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45) {
                self.imageView.alpha = 0.1
                self.imageView.center = CGPoint(x: 0.0, y: self.view.center.y)
                self.view.layoutIfNeeded()
              }
              
              }, completion: nil)
    }

}
