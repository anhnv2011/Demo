//
//  DemoPropertyAnimationViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class DemoPropertyAnimationViewController: UIViewController {

    var boxView: UIView!
    
    var animation: UIViewPropertyAnimator!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBoxView()
        setupAnimation()
    }
    
    func setupBoxView(){
        boxView = UIView(frame:CGRect(x: 10, y: view.center.y - 100 - 20, width: 100, height: 100))
        boxView.backgroundColor = .red
        view.addSubview(boxView!)
    
    }

    func setupAnimation(){
        animation = UIViewPropertyAnimator(duration: 1, curve: .easeInOut, animations: {
            self.boxView.layer.cornerRadius = self.boxView.frame.height / 2
            self.boxView.transform = self.boxView.transform.rotated(by: CGFloat.pi)
            self.boxView.frame.origin.x = self.view.frame.width - 100 - 10
            self.view.backgroundColor = .black
        })
    }
    @IBAction func sliderValueChange(_ sender: UISlider) {
        animation.fractionComplete = CGFloat(sender.value)
    }
   

}
