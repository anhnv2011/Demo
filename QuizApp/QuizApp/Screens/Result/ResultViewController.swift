//
//  ResultViewController.swift
//  QuizApp
//
//  Created by MAC on 7/21/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayQuestion: [QuestionModel] = []
    var yourAnswer = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Result"
        configureTableView()
    }


    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
  
    func checkResult(){
        var count = 0
        for i in 0...9 {
            if arrayQuestion[i].rightAnswer == yourAnswer[i] {
                count += 1
            }
        }
    }
    @IBAction func actionGoHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultTableViewCell
        cell.bindData(numbers: (indexPath.row, arrayQuestion[indexPath.row].rightAnswer, yourAnswer[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
