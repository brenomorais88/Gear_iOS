//
//  DocumentKind.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import Foundation
import UIKit

class DocumentKind: FilterProtocol {
    func getFilterTitle() -> String {
        return "Tipo de Documento"
    }
    
    func getFilterView() -> UIViewController { return UIViewController() }
    func getFilterOptions() -> [String] { return [] }
    func setSelectedFilter(value: String) {}
    func getSelectedFilter() -> String { return  "" }
    func getIcon() -> String { return "icon_location" }
}
