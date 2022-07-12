//
//  DrawLine.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit

class DrawLine: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawLine(start: CGPoint(x: 50, y: 100), end: CGPoint(x: 350, y: 600))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLine(start: CGPoint, end: CGPoint){
        //Tạo path
        let linepath = UIBezierPath()
        linepath.move(to: start)
        linepath.addLine(to: end)
        linepath.close()
        
        // Tạo layer
        let shapelayer = CAShapeLayer()
        shapelayer.strokeColor = UIColor.green.cgColor
        shapelayer.lineWidth = 5
        
        // add path vao layer
        shapelayer.path = linepath.cgPath
        
        // add layer vao view
        self.layer.addSublayer(shapelayer)
        
    }
}
