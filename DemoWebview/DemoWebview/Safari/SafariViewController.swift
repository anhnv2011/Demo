//
//  SafariViewController.swift
//  DemoWebview
//
//  Created by MAC on 8/5/22.
//

import UIKit
import SafariServices
class SafariViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func actionOpenweb(_ sender: UIButton) {
        let vc = SFSafariViewController(url: URL(string: "https://www.google.com/")!)
        present(vc, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
