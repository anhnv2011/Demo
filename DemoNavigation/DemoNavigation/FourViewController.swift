//
//  FourViewController.swift
//  DemoNavigation
//
//  Created by MAC on 7/12/22.
//

import UIKit

class FourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Man 4"
        let dissmisBarbutton = UIBarButtonItem(title: "Dissmiss", style: .done, target: self,  action:#selector(dissmissVC))
        
        
        let thirdButtonItem  = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goTonew))
        navigationItem.rightBarButtonItems = [dissmisBarbutton, thirdButtonItem]
        
        
    }

    @objc func dissmissVC (){
        for vc in navigationController!.viewControllers {
            if let secondVc = vc as?  SecondViewController {
                navigationController?.popToViewController(secondVc, animated: true)
            }
        }
    }

    @objc func goTonew (){
//        let thirdVC = FourViewController()
//        navigationController?.pushViewController(thirdVC, animated: true)
    }

}

