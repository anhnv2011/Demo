//
//  Oval.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit

class Oval: UIView {

    override func draw(_ rect: CGRect) {
        creatOval()
        
    }

    func creatOval() {
        let path = UIBezierPath(ovalIn: self.bounds)
        UIColor.red.setFill()
        path.fill()
        UIColor.yellow.setStroke()
        path.stroke()
        path.lineWidth = 5
    }
}
