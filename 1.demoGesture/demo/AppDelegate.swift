//
//  AppDelegate.swift
//  demo
//
//  Created by MAC on 6/16/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //ham goi khi vao ap lan dau
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeVC = HomeViewController()
        window?.rootViewController = homeVC
        window?.makeKeyAndVisible()
        return true
    }

  

   


}

