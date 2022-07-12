//
//  RectangularView3.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit

class RectangularView3: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.height/4)
        UIColor.blue.setFill()
        path.fill()
    }
    
}
