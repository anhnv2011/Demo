//
//  Arcs.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit

class Arcs: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
                              radius: self.frame.size.height/2,
                              startAngle: .pi,
                              endAngle: 0,
                              clockwise: true)
        UIColor.red.setFill()
        path.fill()
    }

}
