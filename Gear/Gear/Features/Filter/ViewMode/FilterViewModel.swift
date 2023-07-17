//
//  FilterViewModel.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import Foundation

protocol FilterViewModelProtocol {
    func applyFilter()
}

class FilterViewModel: ViewModel {
    let delegate: FilterViewModelProtocol
    let model = FilterModel()
    
    init(delegate: FilterViewModelProtocol) {
        self.delegate = delegate
        super.init()
    }
    
    func getFilters(filter: FilterKind) ->  [FiltersSession] {
        if filter == .Car {
            return self.model.carFilters
        } else {
            return self.model.motorbikeFilters
        }
    }
}
