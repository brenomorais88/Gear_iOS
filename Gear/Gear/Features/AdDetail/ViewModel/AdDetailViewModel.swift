//
//  AdDetailViewModel.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import Foundation

class AdDetailViewModel: ViewModel {
    let delegate: HomeCoordinatorProtocol
    
    init(delegate: HomeCoordinatorProtocol) {
        
        self.delegate = delegate
        super.init()
    }
    
    func viewTitle() -> String {
        return "Bravo T-jet"
    }
}
