//
//  SecondeViewController.swift
//  DemoNotificationCenter
//
//  Created by MAC on 7/28/22.
//

import UIKit

class SecondeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "seconde"
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("colorChange"), object: nil)
    }
    
    @objc func notificationReceived(){
        view.backgroundColor = .red
    }
    

}
