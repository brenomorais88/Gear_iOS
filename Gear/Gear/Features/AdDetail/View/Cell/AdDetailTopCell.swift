//
//  AdDetailTopCell.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

class AdDetailTopCell: UITableViewCell {
    static let cellID = "AdDetailTopCell"
    
    private let adContent: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private let adsContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldTitleFont
        label.textColor = UIColor.primaryColor
        return label
    }()
    
    private let pageIndicator: UIPageControl = {
        let page = UIPageControl()
        return page
    }()
    
    private var adsPageController: CustomPageViewController?
    private var currentIndex: Int = 0
    private var ads: [AdsPageContentViewController] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "AdCell")
        self.initialSetup()
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.viewCodeSetup()
        self.loadAds()
        self.setupPageController()
        
    }
    
    func setup() {
        valueLabel.text = "R$50.000,00"
    }
    
    private func loadAds() {
        guard let img1 = UIImage(named: "sample_ad_car_1") else { return }
        guard let img2 = UIImage(named: "sample_ad_car_2") else { return }
        guard let img3 = UIImage(named: "sample_ad_car_3") else { return }
        
        ads.append(AdsPageContentViewController(image: img1, pageIndex: 0))
        ads.append(AdsPageContentViewController(image: img2, pageIndex: 1))
        ads.append(AdsPageContentViewController(image: img3, pageIndex: 2))
        ads.append(AdsPageContentViewController(image: img1, pageIndex: 3))
        ads.append(AdsPageContentViewController(image: img2, pageIndex: 4))
        ads.append(AdsPageContentViewController(image: img3, pageIndex: 5))
    }
    
    private func setupPageController() {
        self.adsPageController = CustomPageViewController(transitionStyle: .scroll,
                                                          navigationOrientation: .horizontal,
                                                          options: nil)
        guard let view = self.adsPageController?.view else { return }
        
        self.adsPageController?.dataSource = self
        self.adsPageController?.delegate = self
        
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: self.adsContentView.frame.width,
                            height: self.adsContentView.frame.height)
        
        self.adsContentView.addSubview(view)
        
        let firstVC: UIViewController = self.ads.first ?? UIViewController()
        self.adsPageController?.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        
        updatePageIndicator()
    }
    
    private func updatePageIndicator() {
        pageIndicator.numberOfPages = ads.count
        pageIndicator.currentPage = currentIndex
    }
}

extension AdDetailTopCell: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(adContent)
        self.adContent.addSubview(adsContentView)
        self.adContent.addSubview(pageIndicator)
        self.adContent.addSubview(valueLabel)
        
    }
    
    func viewCodeConstraintSetup() {
        adContent.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        adsContentView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        pageIndicator.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(adsContentView.snp.bottom).inset(30)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
        
        valueLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(adsContentView.snp.bottom).inset(-20)
            make.left.equalToSuperview().inset(16)
        }
    }
}

extension AdDetailTopCell: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
        guard let currentVC = viewController as? AdsPageContentViewController else {
            return nil
        }
            
        currentIndex = currentVC.index
            
        if currentIndex == 0 {
            return nil
        }
            
        currentIndex -= 1
        
        return self.ads[currentIndex]
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let currentVC = viewController as? AdsPageContentViewController else {
            return nil
        }

        currentIndex = currentVC.index

        if currentIndex >= self.ads.count - 1 {
            return nil
        }

        currentIndex += 1
        
        return self.ads[currentIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        updatePageIndicator()
    }
}
