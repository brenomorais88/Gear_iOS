//
//  FilterListOptionsViewController.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import UIKit

class FilterListOptionsViewController: ViewController {

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
        let button = FirstButton(text: "Aplicar Filtro")
        return button
    }()
    
    let viewModel: FilterListOptionsViewModel?
    
    init(viewModel: FilterListOptionsViewModel) {
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
        filtersTableView.register(FilterListOptionsCell.self,
                              forCellReuseIdentifier: FilterListOptionsCell.cellID)
        filtersTableView.reloadData()
    }
}


extension FilterListOptionsViewController: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.contentView.addSubview(filtersTableView)
        self.contentView.addSubview(applyFilterButton)
    }
    
    func viewCodeConstraintSetup() {
        filtersTableView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(applyFilterButton.snp.top).inset(-16)
            make.top.left.right.equalToSuperview()
        }
        
        applyFilterButton.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(-24)
            make.height.equalTo(50)
        }
    }
}

extension FilterListOptionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.filter.getFilterOptions().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FilterListOptionsCell.cellID,
                                                    for: indexPath) as? FilterListOptionsCell {
            let option = self.viewModel?.filter.getFilterOptions()[indexPath.row] ?? ""
            cell.setup(value: option)
            return cell
        
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
