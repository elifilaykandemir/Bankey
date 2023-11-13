//
//  ViewController.swift
//  Bankey
//
//  Created by Elif İlay Eser
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    lazy var signInButton : UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(signInTapped), for:.touchUpInside)
        return button
    }()
    
    lazy var errorMessageLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    var username : String? {
            return loginView.userNameTextField.text
        }
    
    var password : String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        configure()
    }


}

extension LoginViewController {
    
    private func setUp() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func configure() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        loginView.addConstraint(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: nil, height: nil , centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        
        signInButton.addConstraint(top: loginView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: nil, height: nil, centerX: nil, centerY: nil )
        
        errorMessageLabel.addConstraint(top: signInButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: nil, height: nil, centerX: nil, centerY: nil)
    }
}

extension LoginViewController {
    
    @objc func signInTapped(){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username , let password = password else {
            assertionFailure("Username / password should never be nil ")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username and password cannot be blank")
        }
        
        if username == "elif" && password == "1234"{
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username or password")
        }
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
