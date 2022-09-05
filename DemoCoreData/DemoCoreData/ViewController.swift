//
//  ViewController.swift
//  DemoCoreData
//
//  Created by MAC on 7/28/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var phoneTextfiled: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var arrData = [User]()
    //đối tương dung để truy vấn vào bộ nhớ
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        fetchData()
        print(arrData)
    }
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    func fetchData(){
        do {
            self.arrData = try context.fetch(User.fetchRequest())
            self.tableView.reloadData()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    @IBAction func actionSave(_ sender: Any) {
        let newUser = User(context: context)
        newUser.name = nameTextfield.text
        newUser.age = ageTextField.text
        newUser.phone = phoneTextfiled.text
        newUser.adress = addressTextField.text
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func actionShowAll(_ sender: UIButton) {
        fetchData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrData[indexPath.row].name
        cell.detailTextLabel?.text = arrData[indexPath.row].adress
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            
            let userDelete = self.arrData[indexPath.row]
            self.context.delete(userDelete)
            self.fetchData()
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") { (_, _, _) in
            
            let alert = UIAlertController(title: "Edit Phone", message: nil, preferredStyle: .alert)
            alert.addTextField { (textfield) in
                textfield.text = self.arrData[indexPath.row].phone
                
            }
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                //cập nhật phone
                let itemUpdate = self.arrData[indexPath.row]
                itemUpdate.phone = alert.textFields![0].text
                
                do {
                    try self.context.save()
                    self.fetchData()
                } catch let error {
                    print(error.localizedDescription)
                }
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
}
