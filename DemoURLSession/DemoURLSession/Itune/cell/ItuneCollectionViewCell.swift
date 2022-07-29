//
//  ItuneCollectionViewCell.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import UIKit
import SDWebImage
class ItuneCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(name: String, imageURL: String){
        nameLabel.text = name
        guard let url = URL(string: imageURL) else {
            return
        }
        posterImage.sd_setImage(with: url, completed: nil)
    }
}
