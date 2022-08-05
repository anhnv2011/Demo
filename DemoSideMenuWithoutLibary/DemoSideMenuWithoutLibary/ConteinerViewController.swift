//
//  ConteinerViewController.swift
//  DemoSideMenuWithoutLibary
//
//  Created by MAC on 7/18/22.
//

import UIKit

enum MenuState {
    case open
    case close
}

class ConteinerViewController: UIViewController {
    
    
    let homeVC = HomeViewController()
    let menuVC = MenuViewController()
    
    var navc: UINavigationController?
    
    var menustate:MenuState = .close
    
    lazy var inforVC = InforViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        addChildView()
    }
    
    
    
    func addChildView(){
        
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: menuVC)
        menuVC.delegate = self
        
        homeVC.delegate = self
        let nav = UINavigationController(rootViewController: homeVC)
        addChild(nav)
        view.addSubview(nav.view)
        nav.didMove(toParent: self)
        
        self.navc = nav
        
        
    }
    
    func goInforVC(){
        homeVC.addChild(inforVC)
        homeVC.view.addSubview(inforVC.view)
        inforVC.view.frame = homeVC.view.bounds
        inforVC.didMove(toParent: self)
        homeVC.title = "Infor"
    }
    func resetToHome(){
        homeVC.children.forEach({
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        })
        
        homeVC.title = "Home"
    }
    func toggleMenu(){
        switch menustate {
        case .close :
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navc?.view.frame.origin.x = self.homeVC.view.frame.width / 2
            } completion: { (succes) in
                if succes {
                    self.menustate = .open
                }
            }
        case .open:
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navc?.view.frame.origin.x = 0
            } completion: { (succes) in
                if succes {
                    self.menustate = .close
                }
            }
            
        }
        
    }
    
}
extension ConteinerViewController: HomeViewControllerDelegate{
    func tapMenuButton() {
        toggleMenu()
    }
       
    
}

extension ConteinerViewController: MenuViewControllerDelegate{
    func didTapMenu(sender: MenuViewController, menuOption: MenuOptions) {
        print(menuOption)
        switch menuOption {
        case .appRating:
            print("")
        case .home:
            self.resetToHome()
        case .info:
            self.goInforVC()
        case .settings:
            print("")
        case .shareApp:
            print("")
            
        }
        toggleMenu()
        
    }
}
