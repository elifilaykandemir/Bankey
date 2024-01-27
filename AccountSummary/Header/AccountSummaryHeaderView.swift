//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Elif İlay Eser
//

import UIKit

class AccountSummaryHeaderView: UIView {

    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    struct ViewModel{
        let welcomeMessage: String
        let name: String
        let date: Date
        
        var dateFormatted: String {
            return date.monthDayYearString
        }
    }
    var shakeyBell = ShakeyBellView()
    
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
        addSubview(shakeyBell)
        contentView.backgroundColor = appColor
        
        contentView.setUpConstraints(leadingAnchor: self.leadingAnchor,topAnchor: self.topAnchor,trailingAnchor: self.trailingAnchor,bottomAnchor: self.bottomAnchor)

        shakeyBell.setUpConstraints(trailingAnchor: trailingAnchor,
                                    bottomAnchor: bottomAnchor)
        
    }
    
    func configure(viewModel: ViewModel){
        welcomeLabel.text = viewModel.welcomeMessage
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.dateFormatted
    }
}
