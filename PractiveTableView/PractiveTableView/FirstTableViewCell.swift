//
//  FirstTableViewCell.swift
//  PractiveTableView
//
//  Created by MAC on 7/14/22.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

   
    //nếu ko có file xib thì dùng setselected

    let titleLable: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.addSubview(titleLable)
        titleLable.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLable.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }

}
