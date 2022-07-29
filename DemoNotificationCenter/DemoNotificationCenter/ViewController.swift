//
//  ViewController.swift
//  DemoNotificationCenter
//
//  Created by MAC on 7/28/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapMe(_ sender: Any) {
        
        NotificationCenter.default.post(name: Notification.Name("colorChange"), object: nil)
        view.backgroundColor = .red
        
    }
    
}

