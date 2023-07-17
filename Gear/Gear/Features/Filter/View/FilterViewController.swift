//
//  FilterViewController.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import UIKit

class FilterViewController: ViewController {
    
    private let filtersTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 65
        tableView.bounces = false
        return tableView
    }()
    
    private let applyFilterButton: FirstButton = {
        let button = FirstButton(text: "Filtrar")
        return button
    }()
    
    private let cleanFilterButton: SecondaryButton = {
        let button = SecondaryButton(text: "Limpar Filtro")
        return button
    }()
    
    let viewModel: FilterViewModel?
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = nil
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Filtros"
    }
    
    private func setupView() {
        self.tableViewSetup()
        self.setupBackButton()
        self.viewCodeSetup()
    }
    
    private func tableViewSetup() {
        filtersTableView.delegate = self
        filtersTableView.dataSource = self
        filtersTableView.register(FilterCell.self,
                              forCellReuseIdentifier: FilterCell.cellID)
        filtersTableView.reloadData()
    }
}

extension FilterViewController: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.contentView.addSubview(filtersTableView)
        self.contentView.addSubview(cleanFilterButton)
        self.contentView.addSubview(applyFilterButton)
    }
    
    func viewCodeConstraintSetup() {
        filtersTableView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(cleanFilterButton.snp.top).inset(-16)
            make.top.left.right.equalToSuperview()
        }
        
        cleanFilterButton.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(applyFilterButton.snp.top).inset(-16)
            make.height.equalTo(50)
        }
        
        applyFilterButton.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(-24)
            make.height.equalTo(50)
        }
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.getFilters(filter: .Car).count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filterSession = self.viewModel?.getFilters(filter: .Car)[section]
        return filterSession?.filters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.cellID,
                                                    for: indexPath) as? FilterCell {
            
            let filterSession = self.viewModel?.getFilters(filter: .Car)[indexPath.section]
            guard let filter = filterSession?.filters[indexPath.row] else { return UITableViewCell() }
            cell.setup(filter: filter)
            return cell
        
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filterSession = self.viewModel?.getFilters(filter: .Car)[indexPath.section]
        guard let filter = filterSession?.filters[indexPath.row] else { return }
        self.navigationController?.pushViewController(filter.getFilterView(), animated: true)
    }
}

