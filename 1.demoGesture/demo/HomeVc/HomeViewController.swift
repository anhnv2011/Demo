//
//  HomeViewController.swift
//  demo
//
//  Created by MAC on 6/16/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        // cho ui tuong tac voi nguoi dung
        imageView.isUserInteractionEnabled = true
        
        //tap gesture : cham vao
        //tao gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionTapImage))
        //add gesture
        imageView.addGestureRecognizer(tapGesture)
        
        //pan gesture :cham roei truot
        //let pangesture = UIPanGestureRecognizer (target: self, action: #selector(actionPanImage(gesture:)))
        //"imageView.addGestureRecognizer(pangesture)
                
        
        // long press gesture : giu lau (thuong la 1.5s)
        let longgesture = UILongPressGestureRecognizer(target: self, action: #selector(actionLongGestureImagae))
        imageView.addGestureRecognizer(longgesture)
        
        
        // pin gesture : dung 2 ngon tay de thu phog
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(actionPinGestureImagae(gesture:)))
        imageView.addGestureRecognizer(pinGesture)
        
        
        // rotate  gesture : dung 2 ngon de xoay
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(actionRotateGestureImage(gesture:)))
        imageView.addGestureRecognizer(rotateGesture)
        
        
        // Swipe Gesture : vuot len xuong
        let topGesture = UISwipeGestureRecognizer (target: self, action: #selector(swipeUP))
        topGesture.direction = .up
        imageView.addGestureRecognizer(topGesture)
        
        
        // Swift se thuc hien cac cau lenh trong thoi gian minh truyen vao
        UIView.animate(withDuration: 3) {
            self.imageView.alpha = 0
            self.imageView.frame = CGRect(x: 0, y: 0, width: 2, height: 2)
        }
    }

    @objc func actionTapImage (){
        print("aaaaa")
    }

    @objc func actionPanImage (gesture: UIPanGestureRecognizer){
        let point = gesture.location(in: view)
        
        imageView.center = point
    }
    
    @objc func actionLongGestureImagae (){
        print("bbb")
    }
    @objc func actionPinGestureImagae(gesture: UIPinchGestureRecognizer){
        print(gesture.scale)
        imageView.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
    }
    @objc func actionRotateGestureImage (gesture: UIRotationGestureRecognizer){
        imageView.transform = CGAffineTransform(rotationAngle: gesture.rotation)
    
    }
    
    @objc func swipeUP(){
        print("top")
    }
}
