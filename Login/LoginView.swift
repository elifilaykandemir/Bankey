//
//  LoginView.swift
//  Bankey
//
//  Created by Elif İlay Eser
//

import Foundation
import UIKit

class LoginView : UIView {
    
    lazy var  dividerView : UIView = {
        var dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        return dividerView
    }()
    
    lazy var stackView : UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var userNameTextField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Username"
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Password"
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.enablePassswordToggle()
        return textField
    }()
 
    override init(frame:CGRect) {
        super.init(frame: frame)
        configure()
        setUpLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension LoginView {
    
    func configure() {
        backgroundColor = .secondarySystemBackground
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
    }
    
    func setUpLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.setUpConstraints(leadingAnchor: leadingAnchor, leadingConstant: 8, topAnchor: topAnchor ,
                                   trailingAnchor: trailingAnchor, trailingConstant: 8,
                                   bottomAnchor: bottomAnchor,
                                   centerYAnchor: centerYAnchor, centerXAnchor: centerXAnchor)

        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}

//MARK: - UITextFieldDelegate
extension LoginView : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
}

