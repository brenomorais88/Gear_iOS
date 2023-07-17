//
//  AdDetailHeaderView.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit
import Foundation
import SnapKit

class AdDetailHeaderView: UIView {
    let text: String

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        self.text = text
        super.init(frame: CGRect.zero)
        self.setupText()
        self.backgroundColor = .white
    }
    
    private func setupText() {
        let label = UILabel()
        label.text = self.text
        label.font = UIFont.boldMediumTextFont
        label.numberOfLines = 0
        label.textColor = UIColor.detailTextColor
        self.addSubview(label)
        
        label.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
    }
}
