//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Elif İlay KANDEMİR on 4.01.2024.
//

import UIKit
import Foundation

class AccountSummaryCell: UITableViewCell {
    static var reuseID = "AccountSummaryCell"
    static let rowHeight : CGFloat = 100
    
    lazy var typeLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Account type"
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Account Name"
        return label
    }()
    
    lazy var underlineView: UIView = {
        var line = UIView()
        line.backgroundColor = appColor
        return line
    }()
    
    lazy var balanceStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var balanceLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .right
        label.text =  "Some balance"
        return label
    }()
    
    lazy var balanceAmountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .right
        label.text =  "$929,466.63"
        return label
    }()
    
    let chevronImageView : UIImageView = {
        let imageView = UIImageView()
        var chevronImage = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        imageView.image = chevronImage
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell{
    
    private func setUp(){
        contentView.addSubview(typeLabel)
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
    }
    private func layout(){
        typeLabel.setUpConstraints(leadingAnchor: leadingAnchor, leadingConstant: 16, topAnchor: topAnchor, topConstant: 16)
        underlineView.setUpConstraints(leadingAnchor: leadingAnchor, leadingConstant: 16, topAnchor: typeLabel.bottomAnchor, topConstant: 8, width: 60, height: 4)
        nameLabel.setUpConstraints(leadingAnchor: leadingAnchor, leadingConstant: 16, topAnchor: underlineView.bottomAnchor, topConstant: 16)
        balanceStackView.setUpConstraints(leadingAnchor: nameLabel.trailingAnchor, leadingConstant: 4, topAnchor: underlineView.topAnchor, topConstant: -8, trailingAnchor: trailingAnchor, trailingConstant: 32)
        chevronImageView.setUpConstraints(topAnchor: underlineView.bottomAnchor, topConstant: -8, trailingAnchor: trailingAnchor, trailingConstant: 8)
    }
}
