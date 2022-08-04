//
//  MainTabBarViewController.swift
//  DemoMVVM
//
//  Created by MAC on 8/4/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configController()
    }
    

    func configController(){
        
        self.tabBar.tintColor = .orange // set mau khi chon
        self.tabBar.backgroundColor = .red
        
        //Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        //Messages
        let messagesVC = MessagesViewController()
        let messagesNavi = UINavigationController(rootViewController: messagesVC)
        messagesNavi.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: "ic-tabbar-messages"), selectedImage: UIImage(named: "ic-tabbar-messages-selected"))
        messagesNavi.tabBarItem.badgeValue = "99"
        messagesNavi.tabBarItem.badgeColor = .blue
        
        //Friends
        let friendsVC = FriendsViewController()
        let friendsNavi = UINavigationController(rootViewController: friendsVC)
        friendsNavi.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "ic-tabbar-friends"), tag: 2)
        
        
        //Profile
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "ic-tabbar-profile"), tag: 3)
        
    
    
        self.setViewControllers([homeNavi, messagesNavi, friendsNavi, profileNavi], animated: true)
    }

}
