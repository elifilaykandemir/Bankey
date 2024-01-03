//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Elif İlay Eser
//

import UIKit

class AccountSummaryHeaderView: UIView {

    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: UIView.noIntrinsicMetric, height: 144)
        }
        
        private func commonInit() {
            
            let bundle = Bundle(for: AccountSummaryHeaderView.self)
            bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)
            addSubview(contentView)
            contentView.backgroundColor = appColor
            
            contentView.setUpConstraints(leadingAnchor: self.leadingAnchor,topAnchor: self.topAnchor,trailingAnchor: self.trailingAnchor,bottomAnchor: self.bottomAnchor)
            
        }
    }
