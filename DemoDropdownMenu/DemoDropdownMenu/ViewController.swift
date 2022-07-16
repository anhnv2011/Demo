//
//  ViewController.swift
//  DemoDropdownMenu
//
//  Created by MAC on 7/12/22.
//

import UIKit
import DropDown


class ViewController: UIViewController {

    @IBOutlet weak var testTextField: UITextField!
    let menu:DropDown = {
       let menu = DropDown()
        menu.dataSource = [
            "Item 1",
            "Item 2",
            "Item 3",
            "Item 4",
            "Item 5"
            
        ]
        let image = [
            "house",
            "gear",
            "bookmark",
            "ear",
            "book"
        ]
        menu.cellNib = UINib(nibName: "DropDownCell", bundle: nil) // name trong table view cell identify
        menu.customCellConfiguration = { index, string, cell in
            guard let cell = cell as? MyCell else {
                return
            }
            cell.avartarImageView.image = UIImage(systemName: image[index])
           
            
            
        }
        return menu
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        testTextField.delegate = self
        menu.anchorView = testTextField
        
        menu.selectionAction = { index, title in
            self.testTextField.text = "\(index) : \(title)"
        }
    }

}

extension ViewController:UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("aaa")
//        menu.show()
//    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return false
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        DispatchQueue.main.async {
            self.menu.show()
        }
        

        return true
    }
}
