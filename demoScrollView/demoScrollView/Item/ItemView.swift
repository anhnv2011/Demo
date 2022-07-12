//
//  ItemView.swift
//  demoScrollView
//
//  Created by MAC on 7/9/22.
//

import UIKit

class ItemView: UIView {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var containerView: UIView!
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    override func draw(_ rect: CGRect) {
//        descriptionTextView.text = ""
        
        //không cho chỉnh sửa, chỉ cho hiển thị
        descriptionTextView.isEditable = false
        descriptionTextView.textAlignment = . center
        containerView.backgroundColor = .red
    }

}
