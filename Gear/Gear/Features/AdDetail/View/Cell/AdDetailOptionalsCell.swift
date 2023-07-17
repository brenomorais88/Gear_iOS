//
//  AdDetailOptionalsCell.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

class AdDetailOptionalsCell: UITableViewCell {
    static let cellID = "AdDetailOptionalsCell"
    
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
    
    var optionals: [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "AdDetailOptionalsCell")
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
            "Ar condicionado",
            "Direção Eletrica",
            "Desembaçador traseiro",
            "Controle de Tração",
            "GPS",
            "AirBag",
            "Rodas de Liga",
            "IsoFix",
            "Radio",
            "Rodas de Liga",
            "IsoFix",
            "Radio"
        ]
        
        self.viewCodeSetup()
    }
}

extension AdDetailOptionalsCell: ViewCodeProtocol {
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
            let label = createLabel(text: item)
            
            if lastStack == 0 {
                lastStack = 1
                rightStackView.addArrangedSubview(label)
            } else {
                lastStack = 0
                leftStackView.addArrangedSubview(label)
            }
        }
    }
    
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 2
        label.backgroundColor = .white
        return label
    }
}
