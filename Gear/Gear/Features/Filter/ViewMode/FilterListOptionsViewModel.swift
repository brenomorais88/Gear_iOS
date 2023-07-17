//
//  FilterListOptionsViewModel.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import Foundation

class FilterListOptionsViewModel: ViewModel {
    let filter: FilterProtocol
    
    init(filter: FilterProtocol) {
        self.filter = filter
        super.init()
    }
}
