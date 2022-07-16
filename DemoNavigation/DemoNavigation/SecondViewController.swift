//
//  SecondViewController.swift
//  DemoNavigation
//
//  Created by MAC on 7/12/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Man 2"
       
        navigationController?.navigationBar.backgroundColor = .blue
        
        let dissmisBarbutton = UIBarButtonItem(title: "Dissmiss", style: .done, target: self,  action:#selector(dissmissVC))
        
        
        let secondButtonItem  = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goTonew))
        navigationItem.rightBarButtonItems = [dissmisBarbutton, secondButtonItem]
        
        
    }

    @objc func dissmissVC (){
        navigationController?.popViewController(animated: true)
    }

    @objc func goTonew (){
        let thirdVC = ThirdViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }

}
