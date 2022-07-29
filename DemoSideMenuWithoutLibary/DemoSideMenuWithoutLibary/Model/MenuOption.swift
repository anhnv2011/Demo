//
//  MenuOption.swift
//  DemoSideMenuWithoutLibary
//
//  Created by MAC on 7/18/22.
//

import Foundation
 
enum MenuOptions: String, CaseIterable {
    case home = "Home"
    case settings = "Setting"
    case info = "Information"
    case appRating = "App Rating"
    case shareApp = "Share App"
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .settings:
            return "gear"
        case .info:
            return "airplane"
        case .appRating:
            return "star"
        case .shareApp:
            return "message"
        }
    }
}

//let homeVC = HomeViewController()
//let menuVC = MenuViewController()
//override func viewDidLoad() {
//    super.viewDidLoad()
//    view.backgroundColor = .brown
//    addChildView()
//}
//
//
//func addChildView(){
//    
//    addChild(menuVC)
//    view.addSubview(menuVC.view)
//    menuVC.didMove(toParent: menuVC)
//    
//    homeVC.delegate = self
//    let nav = UINavigationController(rootViewController: homeVC)
//    addChild(nav)
//    view.addSubview(nav.view)
//    nav.didMove(toParent: self)
//   
//}
//
//}
//extension ConteinerViewController: HomeViewControllerDelegate{
//func tapMenuButton() {
//    print("asdasd")
//    
//    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
//        self.homeVC.view.frame.origin.x = self.homeVC.view.frame.width / 2
//    } completion: { (succes) in
//        if succes {
//            
//        }
//    }
//
//}
//
//
//}
