//
//  AppDelegate.swift
//  Demo Collectionview
//
//  Created by MAC on 7/17/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Demo2ViewController()
        window?.makeKeyAndVisible()
        return true
    }

   


}

