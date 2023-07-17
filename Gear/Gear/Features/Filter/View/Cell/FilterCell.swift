//
//  FilterCell.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import UIKit

class FilterCell: UITableViewCell {
    static let cellID = "FilterCell"
    
    private let filterIcon: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let filterLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.normalTextColor
        label.font = UIFont.normalTextFont
        label.numberOfLines = 0
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.primaryColor
        label.font = UIFont.normalTextFont
        label.numberOfLines = 0
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "icon_right")
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "FilterCell")
        self.initialSetup()
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
    }
    
    func setup(filter: FilterProtocol) {
        self.filterLabel.text = filter.getFilterTitle()
        filterIcon.image = UIImage(named: filter.getIcon())
        self.valueLabel.text = filter.getSelectedFilter()
        self.viewCodeSetup()
    }
}

extension FilterCell: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(filterIcon)
        self.addSubview(filterLabel)
        if valueLabel.text != "" {
            self.addSubview(valueLabel)
        }
        self.addSubview(arrowIcon)
    }
    
    func viewCodeConstraintSetup() {
        filterIcon.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.width.height.equalTo(24)
        }
        
        if valueLabel.text != "" {
            filterLabel.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview().inset(10)
                make.left.equalTo(filterIcon.snp.right).inset(-8)
                make.right.equalTo(arrowIcon.snp.right).inset(8)
            }
            
            valueLabel.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(filterLabel.snp.bottom).inset(-4)
                make.left.equalTo(filterIcon.snp.right).inset(-8)
                make.right.equalTo(arrowIcon.snp.right).inset(8)
            }
            
        } else {
            filterLabel.snp.makeConstraints { (make) -> Void in
                make.centerY.equalToSuperview()
                make.left.equalTo(filterIcon.snp.right).inset(-8)
                make.right.equalTo(arrowIcon.snp.right).inset(8)
            }
        }
        
        arrowIcon.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(16)
            make.width.height.equalTo(24)
        }
    }
}

