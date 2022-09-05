//
//  ListBookViewController.swift
//  DemoFirebase
//
//  Created by MAC on 8/4/22.
//

import UIKit
import Firebase
class ListBookViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    var book = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "sadaas"
        getDataFromNode(node: "book")
        configTableView()
    }

    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    func getDataFromNode(node: String) {
        db.collection(node).getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                for document in querySnapshot!.documents {
                    if let id = document.data()["id"] as? String,
                       let name = document.data()["name"] as? String,
                       let author = document.data()["author"] as? String,
                       let creatAt = document.data()["creatAt"] as? String,
                       let price = document.data()["price"] as? Float {
                        let book = Book(id: id, name: name, author: author, creatAt: creatAt, price: price)
                        self.book.append(book)
                    }
                }
            }
        }
        tableView.reloadData()
    }

}
extension ListBookViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        return cell
    }
    
    
}
