//
//  NoteCollectionViewCell.swift
//  DemoSingleton
//
//  Created by MAC on 7/19/22.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dateCreateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var handleDelete :(()-> Void)?
    func bindData(item: NoteModel){
        dateCreateLabel.text = "\(item.dateCreated)"
        titleLabel.text = item.title
        contentLabel.text = item.content
        
    }

    @IBAction func actionDelete(_ sender: Any) {
        handleDelete?()
    }
}
