//
//  Triangle.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit

class Triangle: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
       
        createTriangle()
        
       
    }

    func createTriangle(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
        
        UIColor.darkGray.setFill()
        path.fill()
        UIColor.systemPink.setStroke()
        path.stroke()
        path.lineWidth = 5
        
    }
}
