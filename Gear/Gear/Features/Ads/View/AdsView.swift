//
//  AdsView.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit
import Foundation
import SnapKit

protocol AdsViewDelegate {
    func didSelectAd()
}

class AdsView: UIView {
    
    private let adsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 300
        tableView.bounces = false
        return tableView
    }()
    
    private var cellBuilders: [AdCellBuilder] = []
    var delegate: AdsViewDelegate? = nil
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupView()
    }
    
    private func setupView() {
        self.tableViewSetup()
        self.viewCodeSetup()
    }
    
    private func tableViewSetup() {
        self.loadMockedData()
        adsTableView.delegate = self
        adsTableView.dataSource = self
        adsTableView.register(AdCell.self,
                              forCellReuseIdentifier: AdCell.cellID)
        adsTableView.reloadData()
    }
}

extension AdsView: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(adsTableView)
    }
    
    func viewCodeConstraintSetup() {
        adsTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}

extension AdsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellBuilders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AdCell.cellID,
                                                    for: indexPath) as? AdCell {
            let builder = self.cellBuilders[indexPath.row]
            cell.setup(builder: builder)
            return cell
        
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectAd()
    }
}

extension AdsView {
    //temporary Data
    func loadMockedData() {
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_1"),
                                          title: "Fiat Bravo T-jet",
                                          value: "R$ 70.000,00",
                                          model: "1.4 Turbo",
                                          year: "2016",
                                          kms: "20.000 KM",
                                          location: "São Paulo",
                                          color: .red))
        
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_3"),
                                          title: "Fiat Bravo",
                                          value: "R$ 50.000,00",
                                          model: "1.8",
                                          year: "2015",
                                          kms: "67.000 KM",
                                          location: "São Paulo",
                                          color: .gray))
        
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_2"),
                                          title: "Fiat Bravo",
                                          value: "R$ 40.500,00",
                                          model: "1.8",
                                          year: "2012",
                                          kms: "86.060 KM",
                                          location: "São Paulo",
                                          color: .systemPink))
        
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_1"),
                                          title: "Fiat Bravo T-jet",
                                          value: "R$ 70.000,00",
                                          model: "1.4 Turbo",
                                          year: "2016",
                                          kms: "20.000 KM",
                                          location: "São Paulo",
                                          color: .red))
        
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_3"),
                                          title: "Fiat Bravo",
                                          value: "R$ 50.000,00",
                                          model: "1.8",
                                          year: "2015",
                                          kms: "67.000 KM",
                                          location: "São Paulo",
                                          color: .gray))
        
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_2"),
                                          title: "Fiat Bravo",
                                          value: "R$ 40.500,00",
                                          model: "1.8",
                                          year: "2012",
                                          kms: "86.060 KM",
                                          location: "São Paulo",
                                          color: .blue))
        
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_1"),
                                          title: "Fiat Bravo T-jet",
                                          value: "R$ 70.000,00",
                                          model: "1.4 Turbo",
                                          year: "2016",
                                          kms: "20.000 KM",
                                          location: "São Paulo",
                                          color: .red))
        
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_3"),
                                          title: "Fiat Bravo",
                                          value: "R$ 50.000,00",
                                          model: "1.8",
                                          year: "2015",
                                          kms: "67.000 KM",
                                          location: "São Paulo",
                                          color: .purple))
        
        cellBuilders.append(AdCellBuilder(adImage: UIImage(named: "sample_ad_car_2"),
                                          title: "Fiat Bravo",
                                          value: "R$ 40.500,00",
                                          model: "1.8",
                                          year: "2012",
                                          kms: "86.060 KM",
                                          location: "São Paulo",
                                          color: .black))
    }
}
