//
//  AlertViewController.swift
//  DemoEzPopup
//
//  Created by MAC on 7/27/22.
//

import UIKit
protocol AlertViewControllerDelegate: AnyObject {
    func didTapCloseButton(sender: AlertViewController)
}
class AlertViewController: UIViewController {

    
    @IBOutlet weak var tittleLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    var titleString: String?
    var messageString: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        tittleLabel.text = titleString
        messageLabel.text = messageString
    }

    @IBAction func actionClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
}
