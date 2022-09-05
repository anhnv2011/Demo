//
//  ShapesMasksLayerViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class ShapesMasksLayerViewController: UIViewController {
    @IBOutlet weak var ringButton: UIButton!
    
    @IBOutlet weak var groupButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    
    
    @IBAction func drawCircle(_ sender: UIButton) {
        switch sender {
        case groupButton:
            groupStroke()
        case changeButton:
            changeToAnotherform()
        case ringButton:
            ring()
        default:
            print("")
        }
        
    }
    func ring(){
        let track = CAShapeLayer()
        track.path = UIBezierPath(arcCenter: view.center,
                                   radius: 150,
                                   startAngle: -(.pi/2),
                                   endAngle: .pi * 2 ,
                                   clockwise: true).cgPath
        track.lineWidth = 15
        track.strokeColor = UIColor.gray.cgColor
        track.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(track)

        
        let circle = CAShapeLayer()
        circle.path = UIBezierPath(arcCenter: view.center,
                                   radius: 150,
                                   startAngle: -(.pi/2),
                                   endAngle: .pi * 2 ,
                                   clockwise: true).cgPath
        circle.lineWidth = 15
        circle.strokeColor = UIColor.red.cgColor
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeEnd = 1 // neu set la 0 thi sau ve no bien mat nếu ko có fillmod va isremove
        circle.strokeStart = 1
        view.layer.addSublayer(circle)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0 //0 la chua ve, 1 là full 1 vòng
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        circle.add(animation, forKey: nil)
    }
    func groupStroke(){
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: view.center.x - 50, y: view.center.y - 50, width: 100, height: 100)).cgPath
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 5
        
        circleLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(circleLayer)
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = -0.1 // để chạy xoá sau khi end đã vẽ được
        strokeStartAnimation.toValue = 1.0
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0

        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 3
        strokeAnimationGroup.repeatDuration = 5.0
        strokeAnimationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        circleLayer.add(strokeAnimationGroup, forKey: nil)
        
     
    }
    
    func changeToAnotherform(){
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: view.center.x - 50, y: view.center.y - 50, width: 100, height: 100)).cgPath
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 5
        
        circleLayer.fillColor = UIColor.blue.cgColor
        
        view.layer.addSublayer(circleLayer)
        
        //        //Thay thanh hinhf khac
        let morphAnimation = CABasicAnimation(keyPath: "path")
        morphAnimation.duration = 2
        morphAnimation.toValue = UIBezierPath(roundedRect: CGRect(x: view.center.x , y: view.center.y - 200, width: 100, height: 100), cornerRadius: 12).cgPath
        morphAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        circleLayer.add(morphAnimation, forKey:nil)
    }
    
}
