//
//  RectangularView.swift
//  DemoDrawing
//
//  Created by MAC on 7/11/22.
//

import UIKit
//hình chữ nhật
//C1: set fill hết view
class RectangularView: UIView {

    override func draw(_ rect: CGRect) {
        // khởi tạo path
        let path = creatPath()
        
        // Specify the fill color and apply it to the path. (đổ màu cho trong viền)
        let fillColor = UIColor.orange
        fillColor.setFill()
        path.fill()
        
        // Specify a border (stroke) color.  (set màu cho viền)
           UIColor.purple.setStroke()
           path.stroke()
    }

    func creatPath() -> UIBezierPath{
        let path = UIBezierPath(rect: self.bounds)
        path.lineWidth = 5
        return path
    }
}
