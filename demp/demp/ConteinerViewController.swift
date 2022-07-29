//
//  ConteinerViewController.swift
//  demp
//
//  Created by MAC on 7/18/22.
//

import UIKit

class ConteinerViewController: UIViewController {

    enum MenuState {
        case opened
        case close
    }
    
    private var menuState: MenuState = .close
    let homeVC = HomeViewController()
    let menuVC = MenuViewController()
    
    // dont creat as soon as app launche
    lazy var inforVC = InforViewController()
    
    //cho tittle home di chuyen theo
    var navVC:UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildView()
    }

    private func addChildView(){
        
        menuVC.menuDelegate = self
        //menu
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        
        homeVC.homeviewDelegate = self
        // home
        let nav = UINavigationController(rootViewController: homeVC)
        addChild(nav)
        view.addSubview(nav.view)
        nav.didMove(toParent: self)
        self.navVC = nav
        
    }
    
    func toggleMenu(completion: (() -> Void)?){
        // animate menu
//        print("ssss")
        switch menuState {
        case .close:
            //open
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                //animate
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
            } completion: { [weak self] (success) in
                //success: bool
                if success {
                    self?.menuState = .opened
                }
            }
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                //animate
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] (success) in
                
                if success {
                    self?.menuState = .close
                    
                    // ccó thể execute (thực thi) on background thread mà ta muốn present VC -> liên quan ui -> phải main thread
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension ConteinerViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
//        // animate menu
////        print("ssss")
//        switch menuState {
//        case .close:
//            //menuState = .opened
//            //open
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
//                //animate
//                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
//            } completion: { [weak self] (success) in
//                //success: bool
//                if success {
//                    self?.menuState = .opened
//                }
//            }
//
//        case .opened:
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
//                //animate
//                self.navVC?.view.frame.origin.x = 0
//            } completion: { [weak self] (success) in
//                //success: bool
//                if success {
//                    self?.menuState = .close
//                }
//            }
//        }
        toggleMenu(completion: nil)
        
    }

}


extension ConteinerViewController : MenuViewControllerDelegate {
    func didSelectMenu(menuItem: MenuOptions) {
        print(menuItem)
        
        ///C1 : V Controller ko thay doi cho den khi animation xong
        toggleMenu { [weak self] in
            print("completion")
            switch menuItem {
            case .home:
                self?.resetToHome()
            case .settings:
                break
            case .info:

                self?.addInfor()
            case .appRating:
                break
            case .shareApp:
                break
            }
        }
        
        ///C2 : V Controller thay doi luon
//        toggleMenu(completion: nil)
//
//
//            print("completion")
//            switch menuItem {
//            case .home:
//                resetToHome()
//            case .settings:
//                break
//            case .info:
//                addInfor()
//            case .appRating:
//                break
//            case .shareApp:
//                break
//            }
       
    }
    
    func addInfor(){
        let vc = inforVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = homeVC.view.frame
        vc.didMove(toParent: homeVC)
        
        //vaan o home nhung set tittle cho no la cua infor
        homeVC.title = vc.title
    }
    func resetToHome(){
        inforVC.view.removeFromSuperview()
        inforVC.didMove(toParent: nil)
        homeVC.title = "Home"
    }
    
}
