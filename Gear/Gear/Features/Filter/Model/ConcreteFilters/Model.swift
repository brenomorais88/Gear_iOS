//
//  Model.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import Foundation
import UIKit

class Model: FilterProtocol {
    func getFilterTitle() -> String {
        return "Modelo"
    }
    
    func getFilterView() -> UIViewController { return UIViewController() }
    func getFilterOptions() -> [String] { return [] }
    func setSelectedFilter(value: String) {}
    func getSelectedFilter() -> String { return  "335i" }
    func getIcon() -> String { return "icon_location" }
}