//
//  AdDetailCell.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

class AdDetailCell: UITableViewCell {
    static let cellID = "AdDetailCell"
    
    private let adContent: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private let textView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.borderGray.cgColor
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.normalTextColor
        label.font = UIFont.normalTextFont
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "AdDetailCell")
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
    }
    
    func setup() {
        self.valueLabel.text = "Único dono. Todo original. Rodas de black piano. Pneus Hancock Ventus e Freios Brembo novos. Recém revisado óleo/filtros. Todas as revisões quer por tempo ou km foram realizadas em concessionárias. Impecável. NÃO ACEITO TROCA.  Só usou Podium. Carro de fim de semana."
    }
}

extension AdDetailCell: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(adContent)
        self.adContent.addSubview(textView)
        self.textView.addSubview(valueLabel)
    }
    
    func viewCodeConstraintSetup() {
        adContent.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        textView.snp.makeConstraints { (make) -> Void in
            make.top.bottom.equalToSuperview().inset(8)
            make.left.right.equalToSuperview().inset(16)
        }
        
        valueLabel.snp.makeConstraints { (make) -> Void in
            make.top.bottom.left.right.equalToSuperview().inset(16)
        }
    }
}
