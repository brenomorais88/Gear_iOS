//
//  AdDetailView.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

protocol AdDetailViewDelegate {
}

class AdDetailView: UIView {
    private let adTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 300
        tableView.sectionHeaderTopPadding = .zero
        tableView.bounces = false
        return tableView
    }()
    
    private let contactButton: FirstButton = {
        let button = FirstButton(text: "entrar em contato")
        return button
    }()
    
    var delegate: AdDetailViewDelegate? = nil
    
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
        adTableView.delegate = self
        adTableView.dataSource = self
        adTableView.register(AdDetailTopCell.self,
                              forCellReuseIdentifier: AdDetailTopCell.cellID)
        adTableView.register(AdDetailCell.self,
                              forCellReuseIdentifier: AdDetailCell.cellID)
        adTableView.register(AdDetailInfoCell.self,
                              forCellReuseIdentifier: AdDetailInfoCell.cellID)
        adTableView.register(AdDetailOptionalsCell.self,
                              forCellReuseIdentifier: AdDetailOptionalsCell.cellID)
        adTableView.reloadData()
    }
}

extension AdDetailView: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(adTableView)
        self.addSubview(contactButton)
    }
    
    func viewCodeConstraintSetup() {
        adTableView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(contactButton.snp.top).inset(-16)
            make.top.left.right.equalToSuperview()
        }
        
        contactButton.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(-24)
            make.height.equalTo(50)
        }
    }
}

extension AdDetailView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AdDetailTopCell.cellID,
                                                        for: indexPath) as? AdDetailTopCell {
                cell.setup()
                return cell
            
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AdDetailCell.cellID,
                                                        for: indexPath) as? AdDetailCell {
                cell.setup()
                return cell
            
            }
            
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AdDetailInfoCell.cellID,
                                                        for: indexPath) as? AdDetailInfoCell {
                cell.setup()
                return cell
            
            }
            
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AdDetailOptionalsCell.cellID,
                                                        for: indexPath) as? AdDetailOptionalsCell {
                cell.setup()
                return cell
            
            }
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 250
        case 1, 2, 3:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let view = AdDetailHeaderView(text: "Detalhes")
            return view
        case 2:
            let view = AdDetailHeaderView(text: "Caracteristicas")
            return view
        case 3:
            let view = AdDetailHeaderView(text: "Opcionais")
            return view
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1,2,3:
            return 40
        default:
            return 0
        }
    }
}
