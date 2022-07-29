//
//  ResultTableViewCell.swift
//  QuizApp
//
//  Created by MAC on 7/21/22.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(numbers: (Int, Int, Int)){
        numberLabel.text = "\(numbers.0 + 1)"
        rightLabel.text = "\(numbers.1 + 1)"
        yourAnswerLabel.text = "\(numbers.2 + 1)"
    }
    
    
}
