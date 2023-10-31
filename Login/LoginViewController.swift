//
//  ViewController.swift
//  Bankey
//
//  Created by Elif İlay KANDEMİR on 20.10.2023.
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
        
        loginView.addConstraint(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: nil, height: nil, centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        
        signInButton.addConstraint(top: loginView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: nil, height: nil, centerX: nil, centerY: nil )
    }
}

extension LoginViewController {
    
    @objc func signInTapped(){
        
    }
}
