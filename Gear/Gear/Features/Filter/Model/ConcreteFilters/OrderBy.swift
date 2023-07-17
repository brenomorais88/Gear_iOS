//
//  OrderBy.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import Foundation
import UIKit

class OrderBy: FilterProtocol {
    func getFilterTitle() -> String {
        return "Ordenar por"
    }
    
    func getFilterView() -> UIViewController { return UIViewController() }
    func getFilterOptions() -> [String] { return [] }
    func setSelectedFilter(value: String) {}
    func getSelectedFilter() -> String { return  "" }
    func getIcon() -> String { return "icon_location" }
}
