//
//  CustomView.swift
//  CustomBrick
//
//  Created by MAC on 6/25/22.
//

import UIKit

class CustomView: UIView {


    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .red
        //setUpLabel()
    }

    func setUpLabel (){
        let label = UILabel(frame: self.bounds)
        label.text = "square"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 30, weight: .medium)
        self.addSubview(label)    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
