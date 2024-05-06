//
//  TabBarController.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit

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
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor.darkGray
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = appearance
        } else {
            self.tabBar.tintColor = .white
            self.tabBar.backgroundColor = .gray
        }
        
        self.tabBar.layer.masksToBounds = true
        
        let mainScreenController = TimerViewController()
        let ipSearchController = LocationSearchViewController()
        let aboutAppController = AboutAppViewController()
        
        mainScreenController.tabBarItem = UITabBarItem(
            title: "Timer",
            image: UIImage(systemName: "timer"),
            selectedImage: nil
        )
        ipSearchController.tabBarItem = UITabBarItem(
            title: "Location",
            image: UIImage(systemName: "mappin.circle"),
            selectedImage: nil
        )
        aboutAppController.tabBarItem = UITabBarItem(
            title: "About",
            image: UIImage(systemName: "star.circle"),
            selectedImage: nil
        )
        
        self.setViewControllers(
            [
                mainScreenController,
                ipSearchController,
                aboutAppController
            ],
            animated: false
        )
    }
}
