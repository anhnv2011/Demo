//
//  ProfileViewController.swift
//  DemoFirebase
//
//  Created by MAC on 8/2/22.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    var namelabel = "a"
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = namelabel
        
    }


    @IBAction func actionSignOut(_ sender: Any) {

        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
    
}
