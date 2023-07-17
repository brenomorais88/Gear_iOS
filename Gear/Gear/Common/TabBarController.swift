//
//  TabBarController.swift
//  oCheff
//
//  Created by Breno Carvalho Alves De Morais (Bit2B) on 18/02/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    private var homeCoordinator: HomeCoordinator?
    private var profileCoordinator: ProfileCoordinator?
    private let homeNav = NavigationController()
    private let profileNav = NavigationController()
    
    func setupTabBar() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().isTranslucent = true
//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().backgroundImage = UIImage()
        
        let firstVC = getFirstViewController()
        let thirdVC = getThirdController()
        
        self.viewControllers = [firstVC, thirdVC]
        
        let item1 = UITabBarItem(title: nil,
                                 image: UIImage(named: "icon_home"),
                                 tag: 0)
        item1.selectedImage = UIImage(named: "icon_home_selected")
        
        let item3 = UITabBarItem(title: nil,
                                 image: UIImage(named: "icon_profile"),
                                 tag: 1)
        item3.selectedImage = UIImage(named: "icon_profile_selected")

        firstVC.tabBarItem = item1
        thirdVC.tabBarItem = item3
                
        UITabBar.appearance().tintColor = UIColor.tabbarSelectedColor
    }
    
    func getFirstViewController() -> UIViewController {
        homeCoordinator = HomeCoordinator(navigationController: homeNav)
        homeCoordinator?.start()
        if let nav = homeCoordinator?.navigationController {
            return nav

        } else {
            return UIViewController()
        }
    }
    
    func getThirdController() -> UIViewController {
        profileCoordinator = ProfileCoordinator(navigationController: profileNav)
        profileCoordinator?.start()
        if let nav = profileCoordinator?.navigationController {
            return nav

        } else {
            return UIViewController()
        }
    }
}
