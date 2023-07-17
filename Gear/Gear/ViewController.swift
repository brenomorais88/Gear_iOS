//
//  ViewController.swift
//  Gear
//
//  Created by Breno Morais on 30/05/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appViewsBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupContentView()
        self.navSetup()
        // Do any additional setup after loading the view.
    }
    
    func setupContentView() {
        self.view.backgroundColor = UIColor.appTabbarBackgound
        self.view.addSubview(contentView)
        
        contentView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    private func navSetup() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.white
        navBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.normalTextColor
        ]

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = navBarAppearance
    }
}

