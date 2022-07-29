//
//  HomeViewController.swift
//  demp
//
//  Created by MAC on 7/18/22.
//


import UIKit
protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}
class HomeViewController: UIViewController {

    weak var homeviewDelegate: HomeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem (image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
        view.backgroundColor = .blue
    }
    
    
    @objc func didTapMenuButton (){
        homeviewDelegate?.didTapMenuButton()
    }

}
