//
//  AdCell.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

struct AdCellBuilder {
    let adImage: UIImage?
    let title: String
    let value: String
    let model: String
    let year: String
    let kms: String
    let location: String
    let color: UIColor
}

class AdCell: UITableViewCell {
    static let cellID = "AdCell"
    
    private let adContent: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let adImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldTitleFont
        label.textColor = UIColor.normalTextColor
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldTitleFont
        label.textColor = UIColor.primaryColor
        return label
    }()
    
    private let modelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.normalTextFont
        label.textColor = UIColor.normalTextColor
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.normalTextFont
        label.textColor = UIColor.normalTextColor
        return label
    }()
    
    private let kmsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.normalTextFont
        label.textColor = UIColor.normalTextColor
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.normalTextFont
        label.textColor = UIColor.normalTextColor
        return label
    }()
    
    private let locationIcon: UIImageView = {
        let image = UIImage(named: "icon_location")
        let imageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private let colorView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "AdCell")
        self.initialSetup()
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func initialSetup() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.viewCodeSetup()
    }
    
    func setup(builder: AdCellBuilder) {
        adImage.image = builder.adImage
        titleLabel.text = builder.title
        valueLabel.text = builder.value
        modelLabel.text = builder.model
        yearLabel.text = builder.year
        kmsLabel.text = builder.kms
        locationLabel.text = builder.location
        colorView.backgroundColor = builder.color
    }
}

extension AdCell: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(adContent)
        self.adContent.addSubview(adImage)
        self.adContent.addSubview(titleLabel)
        self.adContent.addSubview(valueLabel)
        self.adContent.addSubview(modelLabel)
        self.adContent.addSubview(yearLabel)
        self.adContent.addSubview(kmsLabel)
        self.adContent.addSubview(locationLabel)
        self.adContent.addSubview(locationIcon)
        self.adContent.addSubview(colorView)
    }
    
    func viewCodeConstraintSetup() {
        adContent.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
            make.left.right.equalToSuperview().inset(16)
        }
        
        adImage.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(adImage.snp.bottom).inset(-12)
            make.left.equalToSuperview().inset(16)
        }
        
        valueLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.right.equalToSuperview().inset(16)
        }
        
        modelLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).inset(-12)
            make.left.equalToSuperview().inset(16)
        }
        
        yearLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(modelLabel.snp.bottom).inset(-8)
            make.left.equalToSuperview().inset(16)
        }
        
        locationIcon.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(yearLabel.snp.bottom).inset(-12)
            make.left.equalToSuperview().inset(16)
            make.width.height.equalTo(16)
            make.bottom.equalToSuperview().inset(12)
        }
        
        locationLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(locationIcon.snp.centerY)
            make.left.equalTo(locationIcon.snp.right).inset(-8)
        }
        
        kmsLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(modelLabel.snp.centerY)
            make.right.equalToSuperview().inset(16)
        }
        
        colorView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(locationLabel.snp.centerY)
            make.right.equalToSuperview().inset(16)
            make.width.height.equalTo(16)
        }
        
    }
}


