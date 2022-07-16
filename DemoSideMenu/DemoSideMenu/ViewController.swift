//
//  ViewController.swift
//  DemoSideMenu
//
//  Created by MAC on 7/12/22.
//

import UIKit
import SideMenu
class ViewController: UIViewController {

    var sideMenu: SideMenuNavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        let menu = MenuViewController(with: SideMenuItem.allCases)
        menu.delegateMenu = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        //set sideMenu thành left side menu
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        
        //pan (kéo ra hiện menu)
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        sideMenu?.menuWidth = view.bounds.width/2
        
        addChildViewController()
    }

    
    let settingVC = SettingViewController()
    let inforVC = InformationViewController()
    func addChildViewController(){
        addChild(settingVC)
        addChild(inforVC)
        
        view.addSubview(settingVC.view)
        view.addSubview(inforVC.view)
        
        settingVC.view.frame = view.bounds
        inforVC.view.frame = view.bounds
        
        settingVC.didMove(toParent: self)
        inforVC.didMove(toParent: self)
        
        settingVC.view.isHidden = true
        inforVC.view.isHidden = true
    }

   
    @IBAction func didTapMenuButton(_ sender: UIBarButtonItem) {
        present(sideMenu!, animated: true, completion: nil)
    }
}

extension ViewController:MenuViewDelegate{
    func didSelectedMenu(menuItem: SideMenuItem) {
        DispatchQueue.main.async { [self] in
            self.sideMenu?.dismiss(animated: true, completion: nil)
            self.title = menuItem.rawValue
            switch menuItem {
            case .home:
                self.settingVC.view.isHidden = true
                self.inforVC.view.isHidden = true
            case .infor:
                self.settingVC.view.isHidden = true
                self.inforVC.view.isHidden = false
            case .setting:
                self.settingVC.view.isHidden = false
                self.inforVC.view.isHidden = true
                
            
            }
        }
    
        
        
//        sideMenu?.dismiss(animated: true, completion: { [weak self] in
//            if menuItem == "Home"{
//                self?.view.backgroundColor = .black
//            }else if menuItem == "Infor"{
//                self?.view.backgroundColor = .blue
//            }else if menuItem == "Setting"{
//                self?.view.backgroundColor = .yellow
//            }
//
//
//        })
    }
    
    
}

extension ViewController: SideMenuNavigationControllerDelegate {
    
}
