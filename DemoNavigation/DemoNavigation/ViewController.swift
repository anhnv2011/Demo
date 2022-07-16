//
//  ViewController.swift
//  DemoNavigation
//
//  Created by MAC on 7/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "asddasdad"
        navigationController?.navigationBar.backgroundColor = .blue
        
        let secondButtonItem  = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ongoSecond))
        navigationItem.leftBarButtonItem = secondButtonItem
        
    }

    @objc func ongoSecond (){
        let secondVc = SecondViewController()
        navigationController?.pushViewController(secondVc, animated: true)
    }

}

