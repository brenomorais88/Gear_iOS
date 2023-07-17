//
//  AdsViewModel.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import Foundation

enum AdsViewKind {
    case allAds
    case favoriteAds
    case myAds
}

class AdsViewModel: ViewModel {
    let delegate: HomeCoordinatorProtocol
    let adsViewKind: AdsViewKind
    
    init(adsViewKind: AdsViewKind,
         delegate: HomeCoordinatorProtocol) {
        
        self.delegate = delegate
        self.adsViewKind = adsViewKind
        super.init()
    }
    
    func viewTitle() -> String {
        switch adsViewKind {
        case .allAds:
            return "Anuncios"
        case .favoriteAds:
            return "Favoritos"
        case .myAds:
            return "Meus Anuncios"
        }
    }
    
    func showAd() {
        self.delegate.showAd()
    }
    
    func showFilter(delegate: FilterViewModelProtocol) {
        self.delegate.showFilter(delegate: delegate)
    }
}
