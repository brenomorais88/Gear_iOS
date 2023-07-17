//
//  FilterListOptionsCell.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import UIKit

class FilterListOptionsCell: UITableViewCell {
    static let cellID = "FilterListOptionsCell"
     
    private let filterLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.normalTextColor
        label.font = UIFont.normalTextFont
        label.numberOfLines = 0
        return label
    }()
    
    private let selectionIcon: UIImageView = {
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
    
    func setup(value: String) {
        self.filterLabel.text = value
        self.viewCodeSetup()
    }
}

extension FilterListOptionsCell: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(filterLabel)
        self.addSubview(selectionIcon)
    }
    
    func viewCodeConstraintSetup() {
        filterLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
        }
        
        selectionIcon.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(16)
            make.width.height.equalTo(24)
        }
    }
}


