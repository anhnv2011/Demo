//
//  FormViewController.swift
//  PractivePresent
//
//  Created by MAC on 6/25/22.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var textName = ""
    var handler: ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = textName
    }

    @IBAction func actionClose(_ sender: UIButton) {
        handler!(nameTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    

}
