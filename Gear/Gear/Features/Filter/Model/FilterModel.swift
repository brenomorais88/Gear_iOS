//
//  FilterModel.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import Foundation
import UIKit

protocol FilterProtocol {
    func getFilterView() -> UIViewController
    func getFilterOptions() -> [String]
    func getFilterTitle() -> String
    func setSelectedFilter(value: String)
    func getSelectedFilter() -> String
    func getIcon() -> String
}

enum FilterKind {
    case Car
    case Motorbike
}

struct FiltersSession {
    let filters: [FilterProtocol]
    let session: String
}

class FilterModel {
    var carFilters: [FiltersSession] = []
    var motorbikeFilters: [FiltersSession] = []
    
    init() {
        self.loadCarFilters()
        self.loadMotorbikeFilters()
    }
    
    private func loadCarFilters() {
        var filters: [FiltersSession] = []
        
        let firstSession = FiltersSession(filters: [OrderBy()], session: "Ordenação")
        let secondSession = FiltersSession(filters: [Brand(), Year(), Price(), Location(), KM()], session: "filtros")
        let thirdSession = FiltersSession(filters: [Traction(), Color(), Exchange(), Fuel(), Alimentation(), DocumentKind(), Optionals()], session: "Filtros avançados")
        
        filters.append(firstSession)
        filters.append(secondSession)
        filters.append(thirdSession)
        
        self.carFilters = filters
    }
    
    private func loadMotorbikeFilters() {
        var filters: [FiltersSession] = []
        
        let firstSession = FiltersSession(filters: [OrderBy()], session: "Ordenação")
        let secondSession = FiltersSession(filters: [Brand(), Model(), Year(), Price(), Location(), KM()], session: "filtros")
        let thirdSession = FiltersSession(filters: [Color(), Fuel(), DocumentKind(), Optionals()], session: "Filtros avançados")
        
        filters.append(firstSession)
        filters.append(secondSession)
        filters.append(thirdSession)
        
        self.motorbikeFilters = filters
    }
}



// POSSIVEIS FILTROS
//
//
// - LITRAGEM DO MOTOR
// - QUANTIDADE DE CILINDROS
