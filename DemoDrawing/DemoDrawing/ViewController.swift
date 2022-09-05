//
//  ViewController.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit

class ViewController: UIViewController {

    let lineView = DrawLine()
    let rectangular = RectangularView() // tứ giác
    let rectangular2 = RectangularView2()
    let rectangular3 = RectangularView3()
    let rectangular4 = RectangularView4()
    let triangle = Triangle()
    let circle = Circle()
    let oval = Oval()
    let customBrick = CustomBrickView()
    let arc = Arcs() // 1 phaanf hinh tron
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lineView.frame = view.bounds
        view.addSubview(lineView)
        rectangular.frame = CGRect (x: 30, y: 30, width: 100, height: 100)
        view.addSubview(rectangular)
        
        rectangular2.frame = CGRect(x: 30, y: 140, width: 100, height: 100)
        view.addSubview(rectangular2)
        
        rectangular3.frame = CGRect(x: 30, y: 250, width: 100, height: 100)
        view.addSubview(rectangular3)
        
        rectangular4.frame = CGRect(x: 30, y: 360, width: 100, height: 100)
        view.addSubview(rectangular4)
        
        triangle.frame = CGRect(x: 140, y: 30, width: 100, height: 100)
        view.addSubview(triangle)
        
        circle.frame = CGRect(x: 140, y: 140, width: 200, height: 100)
        view.addSubview(circle)
        
        oval.frame = CGRect(x: 250, y: 30, width: 150, height: 100)
        view.addSubview(oval)
        
        customBrick.frame = CGRect (x: 140, y: 250, width: 200, height: 200)
        view.addSubview(customBrick)
        
        arc.frame = CGRect (x: 30, y: 470, width: 100, height: 100)
        view.addSubview(arc)
    
    }

  
}

