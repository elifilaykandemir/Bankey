//
//  ViewController.swift
//  Bankey
//
//  Created by Elif İlay Eser
//

import UIKit

protocol LogoutDelegate : AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate : AnyObject {
    func didLogin(_ sender: LoginViewController)
    
}

class LoginViewController: UIViewController {
    
    weak var delegate : LoginViewControllerDelegate?
    
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
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
     
        
        loginView.setUpConstraints(leadingAnchor: view.leadingAnchor, leadingConstant: 20,
                                   trailingAnchor: view.trailingAnchor, trailingConstant: 14,
                                   centerYAnchor: view.centerYAnchor, centerXAnchor: view.centerXAnchor
        )
    
        signInButton.setUpConstraints(leadingAnchor: view.leadingAnchor, leadingConstant: 20,
                                      topAnchor:loginView.bottomAnchor, topConstant: 16,
                                      trailingAnchor: view.trailingAnchor, trailingConstant: 16
        )
        
        errorMessageLabel.setUpConstraints(leadingAnchor: view.leadingAnchor, leadingConstant: 16,
                                           topAnchor:signInButton.bottomAnchor, topConstant: 16,
                                           trailingAnchor: view.trailingAnchor, trailingConstant: 16
        )
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
        
        if username == "" && password == ""{
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin(self)
        } else {
            configureView(withMessage: "Incorrect username or password")
        }
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
