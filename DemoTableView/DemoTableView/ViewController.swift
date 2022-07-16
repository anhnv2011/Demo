//
//  ViewController.swift
//  DemoTableView
//
//  Created by MAC on 7/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }


    func configTableView(){
        
        // phuương thức tương tác với cell
        tableView.delegate = self
        
        //tương tác với data
        tableView.dataSource = self
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //chỉnh màu đường kẻ ngăn căchs, để là clear nếu ko muốn hiện
        tableView.separatorColor = .red
        
        //khoảng cách padding 4 mép của cả table view
        tableView.contentInset = .init(top: 16, left: 0, bottom: 50, right: 0)
        
        //ẩn row rỗng
        tableView.tableFooterView = UIView()
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //default chỉ có 1 label
        //subtitle: có 1 image, 1 title, 1 detail
        if indexPath.section == 0 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row)"
            
            //tat hieu ung seletion
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell.textLabel?.text = "\(indexPath.section)"
            cell.detailTextLabel?.text = "\(indexPath.row)"
            cell.imageView?.image = UIImage(systemName: "xmark")
            return cell
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  tableView.deselectRow(at: indexPath, animated: true)
        print("\(indexPath.section) - \(indexPath.row)")
    }
    
    //bắt sự kiện khi người dùng bỏ chon
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Did Unchose row: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section : \(section)"
    }
    
//    //custom hành động kéo cell tu phải sang
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteButton = UIContextualAction(style: .destructive, title: "delete") { (_, _, _) in
//            print("Deleted Row \(indexPath.row)")
//        }
//        deleteButton.backgroundColor = .red
//        let configuration = UISwipeActionsConfiguration(actions: [deleteButton])
//        return configuration
//    }
//
//    // từ trái sang phải
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let editButton = UIContextualAction(style: .normal, title: "edit") { (_, _, _) in
//            print("go to edit : \(indexPath.row)")
//        }
//        editButton.backgroundColor = .blue
//        let configuration = UISwipeActionsConfiguration(actions: [editButton])
//        return configuration
//    }
    
    
    
    // ĐỘ ưu tiên kém hơn 2 hàm swipe
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Style delete")
        }
    }
    
    //vì tableView kế thừa từ scrollView nên có mọi delegate của scroll view
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scroling")
    }
}
