//
//  BaseNavigationController.swift
//  ColorWidget
//
//  Created by Thien Tung on 11/07/2022.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigation()
    }
    
    private func configNavigation() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor.white
        navigationBar.tintColor = .white
        navigationBar.prefersLargeTitles = false
        
        if IS_IPAD {
            navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white,
                                                 NSAttributedString.Key.font: UIFont.boldWith(24)]
        } else {
            navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white,
                                                 NSAttributedString.Key.font: UIFont.boldWith(20)]
        }
        
        self.delegate = self
        
        navigationBar.shadowImage = UIImage()
        
        let imgBack = UIImage(named: "ic_back_default")
        navigationBar.backIndicatorImage = imgBack
        navigationBar.backIndicatorTransitionMaskImage = imgBack
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}

extension BaseNavigationController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)

        viewController.navigationItem.backBarButtonItem = item
    }
}
