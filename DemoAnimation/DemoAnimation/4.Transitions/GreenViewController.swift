//
//  GreenViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit

class GreenViewController: UIViewController {

    let subview = UIView()
    var completion: ((String)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

    }
   
    
}
