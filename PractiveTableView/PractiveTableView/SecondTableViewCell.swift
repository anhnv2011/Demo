//
//  SecondTableViewCell.swift
//  PractiveTableView
//
//  Created by MAC on 7/14/22.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.current.userInterfaceIdiom == .pad {
            titleLabel.font = .systemFont(ofSize: 22)
            detailLabel.font = .systemFont(ofSize: 18)
        } else {
            titleLabel.font = .systemFont(ofSize: 20)
            detailLabel.font = .systemFont(ofSize: 16)
        }
    }

    //Truyen du lieu vao cell
    func bindData(text: String, detail: String){
        titleLabel.text = text
        detailLabel.text = detail
        
    }
   
    
}
