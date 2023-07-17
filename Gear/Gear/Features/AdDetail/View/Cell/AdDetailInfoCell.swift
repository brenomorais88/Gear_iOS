//
//  AdDetailInfoCell.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

struct CarInfo {
    let title: String
    let value: String
}

class AdDetailInfoCell: UITableViewCell {
    static let cellID = "AdDetailInfoCell"
    
    private let adContent: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private let detailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.borderGray.cgColor
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let leftStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 8
        view.alignment = .top
        return view
    }()
    
    private let rightStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 8
        view.alignment = .top
        return view
    }()
    
    var optionals: [CarInfo] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "AdDetailInfoCell")
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
    
    func setup() {
        optionals = [
            CarInfo(title: "Cidade", value: "São Paulo"),
            CarInfo(title: "Ano", value: "2021"),
            CarInfo(title: "KM", value: "70.000"),
            CarInfo(title: "Direção", value: "Elétrica"),
            CarInfo(title: "Final da Placa", value: "7"),
            CarInfo(title: "Câmbio", value: "Manual"),
            CarInfo(title: "Combustivel", value: "Gasolina"),
        ]
        
        self.viewCodeSetup()
    }
}

extension AdDetailInfoCell: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(adContent)
        self.adContent.addSubview(detailsView)
        self.detailsView.addSubview(leftStackView)
        self.detailsView.addSubview(rightStackView)
    }
    
    func viewCodeConstraintSetup() {
        adContent.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        detailsView.snp.makeConstraints { (make) -> Void in
            make.top.bottom.equalToSuperview().inset(8)
            make.left.right.equalToSuperview().inset(16)
        }
        
        leftStackView.snp.makeConstraints { (make) -> Void in
            let width = (UIScreen.main.bounds.size.width - 80) / 2
            make.top.bottom.left.equalToSuperview().inset(16)
            make.width.equalTo(width)
        }
        
        rightStackView.snp.makeConstraints { (make) -> Void in
            let width = (UIScreen.main.bounds.size.width - 80) / 2
            make.top.right.equalToSuperview().inset(16)
            make.width.equalTo(width)
        }
        
        var lastStack = 1
        
        for item in optionals {
            let view = createView(info: item)
            
            if lastStack == 0 {
                lastStack = 1
                rightStackView.addArrangedSubview(view)
            } else {
                lastStack = 0
                leftStackView.addArrangedSubview(view)
            }
        }
    }
    
    private func createView(info: CarInfo) -> UIView {
        let view = UIView()
        
        let titleLabel = UILabel()
        titleLabel.text = info.title
        titleLabel.textColor = .detailTextColor
        titleLabel.font = UIFont.normalTextFont
    
        let valueLabel = UILabel()
        valueLabel.text = info.value
        valueLabel.textColor = .normalTextColor
        valueLabel.font = UIFont.normalTextFont
        
        view.addSubview(titleLabel)
        view.addSubview(valueLabel)
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.right.left.equalToSuperview()
        }
        
        valueLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.right.left.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).inset(-4)
        }
        
        return view
    }
}
