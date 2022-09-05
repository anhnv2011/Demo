//
//  RedViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class RedViewController: UIViewController {
   
    var completion: ((String)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
       

    }
  
}
