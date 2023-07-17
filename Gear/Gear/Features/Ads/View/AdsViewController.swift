//
//  AdsViewController.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

class AdsViewController: ViewController {
    
    private let adsView: AdsView = {
        let view = AdsView()
        return view
    }()
    
    let viewModel: AdsViewModel?
    
    init(viewModel: AdsViewModel) {
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
        self.setupBackButton()
        self.setupFilterButton()
        self.title = self.viewModel?.viewTitle()
        self.viewCodeSetup()
        self.adsView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupFilterButton() {
        let menuBtn = UIButton(type: .custom)
        menuBtn.setImage(UIImage(named:"icon_filter"), for: .normal)
        menuBtn.addTarget(self, action: #selector(showFilter), for: .touchUpInside)

        let rightBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = rightBarItem.customView?.widthAnchor.constraint(equalToConstant: 20)
        currWidth?.isActive = true
        let currHeight = rightBarItem.customView?.heightAnchor.constraint(equalToConstant: 20)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        navigationItem.rightBarButtonItem?.tintColor = UIColor.primaryColor
    }
    
    //MARK: actions
    @objc private func showFilter() {
        self.viewModel?.showFilter(delegate: self)
    }
}

extension AdsViewController: FilterViewModelProtocol {
    func applyFilter() {
        print("apply filter")
    }
}

extension AdsViewController: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.contentView.addSubview(self.adsView)
    }
    
    func viewCodeConstraintSetup() {
        adsView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}

extension AdsViewController: AdsViewDelegate {
    func didSelectAd() {
        self.viewModel?.showAd()
    }
}
