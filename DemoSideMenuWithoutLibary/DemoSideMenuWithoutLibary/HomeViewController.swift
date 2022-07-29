//
//  HomeViewController.swift
//  DemoSideMenuWithoutLibary
//
//  Created by MAC on 7/18/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func tapMenuButton()
}
class HomeViewController: UIViewController {

    var delegate : HomeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem (image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
        view.backgroundColor = .blue
    }

    @objc func didTapMenuButton(){
        delegate?.tapMenuButton()
    }

}
