//
//  HomveViewController.swift
//  QuizApp
//
//  Created by MAC on 7/21/22.
//

import UIKit

class HomveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let names1 = ["1", "2", "3", "2", "5"]
//        let names2 = ["1", "2", "4", "2", "2"]
//        let answer = zip(names1, names2).enumerated().filter() {
//            $0. == $0.1
//        }.map{$0.0}.count
//        print(answer)
    }

    @IBAction func actionStart(_ sender: UIButton) {
        navigationController?.pushViewController(QuestionViewController(), animated: true)
    }
    
}
