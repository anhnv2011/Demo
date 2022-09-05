//
//  TransitionsViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class TransitionsViewController: UIViewController {

    @IBOutlet weak var transitionFlipFromLeft: UIView!
    @IBOutlet weak var transitionFlipFromRight: UIView!
    @IBOutlet weak var transitionCurlUp: UIView!
    @IBOutlet weak var transitionCurlDown: UIView!
    @IBOutlet weak var transitionCrossDissolve: UIView!
    @IBOutlet weak var transitionFlipFromTop: UIView!
    @IBOutlet weak var transitionFlipFromBottom: UIView!
    
    
    let redVc = RedViewController()
    let greenVc = GreenViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }

    func setUpView(){
//        transitionFlipFromLeft.isUserInteractionEnabled = true
//        let panGesture = UIGestureRecognizer(target: self, action: #selector(pangGesture))
//        transitionFlipFromLeft.addGestureRecognizer(panGesture)
//        transitionFlipFromLeft.addSubview(redVc.view)
//        redVc.view.frame = transitionFlipFromLeft.bounds
//        redVc.completion? = { result in
//            print(result)
//        }
//        transitionFlipFromLeft.addSubview(greenVc.view)
//        greenVc.view.frame = transitionFlipFromLeft.frame
//        
//        greenVc.completion? = { result in
//            print(result)
//            
//        }
        
        
        transitionFlipFromRight.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionTapView))
        //add gesture
        transitionFlipFromRight.addGestureRecognizer(tapGesture)
            transitionFlipFromRight.addSubview(redVc.view)
        redVc.view.frame = transitionFlipFromLeft.bounds

       
    }
    var isRed = true
    @objc func actionTapView(){
     
        if isRed {
            UIView.transition(with: self.transitionFlipFromRight,
                                      duration: 2.0,
                                      options: [UIView.AnimationOptions.transitionFlipFromRight],
                                      animations: { [self] in
                                        self.transitionFlipFromRight.addSubview(self.greenVc.view)
                                        greenVc.view.frame = self.transitionFlipFromRight.bounds
                    },
                                      completion: { (_) in
                                        
                    })
            isRed.toggle()
        } else {
            UIView.transition(with: self.transitionFlipFromRight,
                                      duration: 2.0,
                                      options: [UIView.AnimationOptions.transitionFlipFromRight],
                                      animations: { [self] in
                                        self.transitionFlipFromRight.addSubview(self.redVc.view)
                                        redVc.view.frame = self.transitionFlipFromRight.bounds
                    },
                                      completion: { (_) in
                                        
                    })
            isRed.toggle()
        }
       
    }
}
