//
//  RectangularView2.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit

class RectangularView2: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        let path = creatRectangular()
        
        UIColor.blue.setFill()
        path.fill()
    
        
        // Specify a border (stroke) color.  (set màu cho viền)
           UIColor.purple.setStroke()
           path.stroke()
        path.lineWidth = 5
    }
    func creatRectangular() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        
        path.close()
        return path
    }
}
