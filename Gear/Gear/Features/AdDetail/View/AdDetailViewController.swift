//
//  AdDetailViewController.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

class AdDetailViewController: ViewController {

    private let adsView: AdDetailView = {
        let view = AdDetailView()
        return view
    }()
    
    let viewModel: AdDetailViewModel?
    
    init(viewModel: AdDetailViewModel) {
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
        self.title = self.viewModel?.viewTitle()
        self.viewCodeSetup()
        self.adsView.delegate = self
        self.contentView.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension AdDetailViewController: ViewCodeProtocol {
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

extension AdDetailViewController: AdDetailViewDelegate {
}
