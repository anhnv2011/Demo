//
//  CreatBookViewController.swift
//  DemoFirebase
//
//  Created by MAC on 8/4/22.
//

import UIKit
import FirebaseFirestore
class CreatBookViewController: UIViewController {
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var authorTextfield: UITextField!
    
    @IBOutlet weak var priceTextfield: UITextField!
    
    @IBOutlet var creatButton: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { [self] err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
    }


    @IBAction func actionButton(_ sender: UIButton) {
        switch sender {
        case creatButton:
            print("")
            let price = priceTextfield.text!
            let pricenumber = Float(price)
            let book = Book(id: UUID().uuidString, name: nameTextField.text!, author: authorTextfield.text!, creatAt: "\(Date())", price: pricenumber!)
            db.collection("book").addDocument(data:[book].dictionary )
        default:
            print("")
        }
    }
    
}
