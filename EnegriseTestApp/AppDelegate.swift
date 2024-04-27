//
//  AppDelegate.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: -
    // MARK: Variables

    let window = UIWindow()
    
    // MARK: -
    // MARK: Internal

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.prepareRootController()
        
        return true
    }
    
    // MARK: -
    // MARK: Private
    
    private func prepareRootController() {
        let tabBarController = TabBarController()
        self.window.rootViewController = tabBarController
        self.window.makeKeyAndVisible()
    }
}

