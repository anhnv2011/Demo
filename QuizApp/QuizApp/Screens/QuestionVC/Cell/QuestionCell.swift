//
//  QuestionCell.swift
//  QuizApp
//
//  Created by MAC on 7/21/22.
//

import UIKit

class QuestionCell: UICollectionViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var listButton: [UIButton]!
   
   
    var handleSelectAnswer: ((Int)-> Void)?
    
    var itemQuestion: QuestionModel!{
        
        didSet {
            
            questionLabel.text = itemQuestion.question
            print(currentAnswerIndex!)
            for index in 0..<listButton.count {
            
               
                listButton[index].setTitle(itemQuestion.arrAnswer[index], for: .normal)
                listButton[index].backgroundColor = currentAnswerIndex! == index ? .darkGray : .brown
                //listButton[index].backgroundColor = .brown
            }
        }
    }
    
    var currentAnswerIndex:Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        
    }

   
    
    @IBAction func actionChooseAnswer(_ sender: UIButton) {
        sender.backgroundColor = .darkGray
//        for index in 0..<listButton.count {
//            if listButton[index].tag != sender.tag {
//                listButton[index].backgroundColor = .brown
//            }
//        }
        
        handleSelectAnswer?(sender.tag)
    }
}
