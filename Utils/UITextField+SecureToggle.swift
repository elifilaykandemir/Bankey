//
//  UITextField+SecureToggle.swift
//  Bankey
//
//  Created by Elif İlay KANDEMİR on 15.01.2024.
//

import UIKit
import Foundation

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    func enablePassswordToggle(){
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    @objc func togglePasswordView(_ sender:Any){
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
