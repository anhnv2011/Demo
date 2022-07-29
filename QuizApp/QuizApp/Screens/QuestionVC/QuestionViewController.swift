//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by MAC on 7/21/22.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Question"
        configureCollectionView()
    }


    var arrQuestion: [QuestionModel] = [
        QuestionModel(question: "1X1 = ?", arrAnswer: ["1", "2", "3", "4"], rightAnswer: 0),
        QuestionModel(question: "1X2 = ?", arrAnswer: ["1", "2", "3", "4"], rightAnswer: 1),
        QuestionModel(question: "1X3 = ?", arrAnswer: ["1", "2", "3", "4"], rightAnswer: 2),
        QuestionModel(question: "1X4 = ?", arrAnswer: ["1", "2", "3", "4"], rightAnswer: 3),
        QuestionModel(question: "1X5 = ?", arrAnswer: ["5", "6", "7", "8"], rightAnswer: 0),
        QuestionModel(question: "1X6 = ?", arrAnswer: ["5", "6", "7", "8"], rightAnswer: 1),
        QuestionModel(question: "1X7 = ?", arrAnswer: ["5", "6", "7", "8"], rightAnswer: 2),
        QuestionModel(question: "1X8 = ?", arrAnswer: ["5", "6", "7", "8"], rightAnswer: 3),
        QuestionModel(question: "1X9 = ?", arrAnswer: ["7", "8", "9", "10"], rightAnswer: 2),
        QuestionModel(question: "1X10 = ?", arrAnswer: ["7", "8", "9", "10"], rightAnswer: 3)

    ]
    var arrAnswers:[Int] = [Int].init(repeating: -1, count: 10){
        didSet{
            if !arrAnswers.contains(-1){
                print("hoan thanh")
                showAlertDone()
            }
        }
    }
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    func showAlertDone(){
        let aleart = UIAlertController(title: nil, message: "Do you want see result", preferredStyle: .alert)
        aleart.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        aleart.addAction((UIAlertAction(title: "Done", style: .default, handler: { (_) in
            let vc = ResultViewController()
            vc.arrayQuestion = self.arrQuestion
            vc.yourAnswer = self.arrAnswers
            self.navigationController?.pushViewController(vc, animated: true)
        })))
       present(aleart, animated: true, completion: nil)
    }
    
}

extension QuestionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrQuestion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! QuestionCell
        cell.currentAnswerIndex = arrAnswers[indexPath.row]
        cell.itemQuestion = arrQuestion[indexPath.row]
        cell.handleSelectAnswer  = { index in
            self.arrAnswers[indexPath.row] = index
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
