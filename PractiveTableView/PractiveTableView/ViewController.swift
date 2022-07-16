//
//  ViewController.swift
//  PractiveTableView
//
//  Created by MAC on 7/14/22.
//

import UIKit

class ViewController: UIViewController {
    var arrName: [String] = ["Ha", "Viet Anh", "Tam", "Hung", "Tung", "Thay Cong"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "firstCell")
        tableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "secondCell")
    }

}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! SecondTableViewCell
            cell.bindData(text: arrName[indexPath.row], detail: "\(indexPath.row)")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstTableViewCell
            cell.titleLable.text = arrName[indexPath.row]
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return UITableView.automaticDimension // Tu động trả về heigh phù hợp, yêu cầu layout các component trong cell đủ để tính height cho cell
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteButton = UIContextualAction(style: .destructive, title: "delete") { (_, _, _) in
            self.arrName.remove(at: indexPath.row)
            //tableView.reloadData() // đổ lại dữ liệu cho table
        
            //đổ lại dữ liệu cho 1 section
            tableView.reloadSections([indexPath.section], with: .left)
        }
        deleteButton.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteButton])
    }
}
