//
//  HomeCoordinator.swift
//  oCheff
//
//  Created by Breno Carvalho Alves De Morais (Bit2B) on 18/02/23.
//

import Foundation

protocol HomeCoordinatorProtocol {
    func searchVehicles()
    func showMyAds()
    func showFavorites()
    func searchVehicleHistoric()
    func createNewAd()
    func showAd()
    func showFilter(delegate: FilterViewModelProtocol)
}

class HomeCoordinator: Coordinator {
    
    override func didInit() {
        let viewModel = HomeViewModel(delegate: self)
        self.viewController = HomeViewController(viewModel: viewModel)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func searchVehicles() {
        let viewModel = AdsViewModel(adsViewKind: .allAds, delegate: self)
        let vc = AdsViewController(viewModel: viewModel)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func showMyAds() {
        let viewModel = AdsViewModel(adsViewKind: .myAds, delegate: self)
        let vc = AdsViewController(viewModel: viewModel)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func showFavorites() {
        let viewModel = AdsViewModel(adsViewKind: .favoriteAds, delegate: self)
        let vc = AdsViewController(viewModel: viewModel)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func searchVehicleHistoric() {
        print("searchVehicleHistoric")
    }
    
    func createNewAd() {
        print("createNewAd")
    }
    
    func showAd() {
        let viewModel = AdDetailViewModel(delegate: self)
        let vc = AdDetailViewController(viewModel: viewModel)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func showFilter(delegate: FilterViewModelProtocol) {
        let viewModel = FilterViewModel(delegate: delegate)
        let vc = FilterViewController(viewModel: viewModel)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc, animated: true)
    }
}
