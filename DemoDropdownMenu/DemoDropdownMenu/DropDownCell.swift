//
//  MyCell.swift
//  DemoDropdownMenu
//
//  Created by MAC on 7/12/22.
//

import UIKit
import DropDown

class MyCell: DropDownCell {
    @IBOutlet weak var avartarImageView: UIImageView!
    
    //Mark:- optional label là mặc định của framework
   
    override func awakeFromNib() {
        super.awakeFromNib()
        avartarImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
