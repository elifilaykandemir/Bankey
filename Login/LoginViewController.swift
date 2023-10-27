//
//  ViewController.swift
//  Bankey
//
//  Created by Elif İlay KANDEMİR on 20.10.2023.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
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
        loginView.addConstraint(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: nil, height: nil, centerX: view.centerXAnchor, centerY: view.centerYAnchor)
    }
}
