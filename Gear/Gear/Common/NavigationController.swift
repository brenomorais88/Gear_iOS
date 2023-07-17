//
//  NavigationController.swift
//  Gear
//
//  Created by Breno Morais on 30/05/23.
//

import Foundation
import UIKit

class NavigationController : UINavigationController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        if let topVC = viewControllers.last {
            return topVC.preferredStatusBarStyle
        }

        return .default
    }
}
