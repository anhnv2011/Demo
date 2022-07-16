//
//  ThirdViewController.swift
//  DemoNavigation
//
//  Created by MAC on 7/12/22.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Man 3"
        let dissmisBarbutton = UIBarButtonItem(title: "Dissmiss", style: .done, target: self,  action:#selector(dissmissVC))
        
        
        let thirdButtonItem  = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goTonew))
        navigationItem.rightBarButtonItems = [dissmisBarbutton, thirdButtonItem]
        
        
    }

    @objc func dissmissVC (){
        navigationController?.popToRootViewController(animated: true)
    }

    @objc func goTonew (){
        let thirdVC = FourViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }

}

