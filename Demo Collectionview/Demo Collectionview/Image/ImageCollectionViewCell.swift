//
//  ImageCollectionViewCell.swift
//  Demo Collectionview
//
//  Created by MAC on 7/17/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(imageName: String){
        containerImage.clipsToBounds = true
        containerImage.image = UIImage(named: "\(imageName)")
    }
}
