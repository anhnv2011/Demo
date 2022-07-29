//
//  ThirdViewController.swift
//  DemoNotificationCenter
//
//  Created by MAC on 7/28/22.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "third"
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("colorChange"), object: nil)
    }
    
    @objc func notificationReceived(){
        view.backgroundColor = .red
    }

}
