//
//  RectangularView4.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit

class RectangularView4: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                            byRoundingCorners: [.topLeft, .bottomRight],
                                            cornerRadii: CGSize(width: 15.0, height: 1))
        UIColor.blue.setFill()
        path.fill()
    }

}
