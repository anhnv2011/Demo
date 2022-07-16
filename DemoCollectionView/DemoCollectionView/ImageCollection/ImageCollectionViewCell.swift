//
//  ImageCollectionViewCell.swift
//  DemoCollectionView
//
//  Created by MAC on 7/16/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var numberLAbel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(imageName: String, number: Int) {
        contentImageView.clipsToBounds = true
        //contentImageView.image = UIImage(named: imageName)
        numberLAbel.text = String(number)
    }
}
