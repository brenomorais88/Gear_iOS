//
//  UIColors.swift
//  Gear
//
//  Created by Breno Morais on 30/05/23.
//

import Foundation
import UIKit

extension UIColor {
    
    //MARK: Cores
    
    static var primaryColor: UIColor {
        return UIColor.colorFromHex("#B70000")
    }
    
    static var appViewsBackground: UIColor {
        return UIColor.colorFromHex("#EBF0F9")
    }
    
    static var borderGray: UIColor {
        return UIColor.colorFromHex("#B5B5B5")
    }
    
    static var normalTextColor: UIColor {
        return UIColor.colorFromHex("#3F3F3F")
    }
    
    static var detailTextColor: UIColor {
        return UIColor.colorFromHex("#B4B4B4")
    }
    
    /// Tabbar colors
    static var appTabbarBackgound: UIColor {
        return UIColor.white
    }
    
    static var tabbarSelectedColor: UIColor {
        return self.primaryColor
    }
    
    //MARK: Util
    
    static func colorFromHex(_ hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
