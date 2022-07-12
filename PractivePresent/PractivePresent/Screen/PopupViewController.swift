//
//  PopupViewController.swift
//  PractivePresent
//
//  Created by MAC on 6/25/22.
//

import UIKit

protocol PassDataDelegate: AnyObject {
    func updateName(name: String)
}

class PopupViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    var nameText = ""
    
    weak var delegate:PassDataDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = nameText
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 20
        containerView.layer.maskedCorners = [.layerMinXMinYCorner,
            .layerMaxXMinYCorner]
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = .blue
        }
    }

    @IBAction func actionClose(_ sender: UIButton) {
        delegate?.updateName(name: nameTextField.text!)
        dismiss(animated: true, completion: nil)
    }
    

}
