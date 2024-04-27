//
//  TabBarController.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit

enum Tabs: Int {
    case main
    case search
    case about
}

final class TabBarController: UITabBarController {
    
    // MARK: -
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
    }
    
    // MARK: -
    // MARK: Private
    
    private func configure() {
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .gray
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
        tabBar.tintColor = UIColor.white
        tabBar.backgroundColor = UIColor.gray
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        self.tabBar.isTranslucent = false
        
        let mainScreenController = TimerViewController()
        let ipSearchController = LocationSearchViewController()
        let aboutAppController = AboutAppViewController()
        
        mainScreenController.tabBarItem = UITabBarItem(
            title: "Timer",
            image: UIImage(systemName: "timer"),
            tag: Tabs.main.rawValue
        )
        ipSearchController.tabBarItem = UITabBarItem(
            title: "Location",
            image: UIImage(systemName: "mappin.circle"),
            tag: Tabs.search.rawValue
        )
        aboutAppController.tabBarItem = UITabBarItem(
            title: "About",
            image: UIImage(systemName: "star.circle"),
            tag: Tabs.about.rawValue
        )
        
        self.setViewControllers(
            [
                mainScreenController,
                ipSearchController,
                aboutAppController
            ],
            animated: false)
    }
}
