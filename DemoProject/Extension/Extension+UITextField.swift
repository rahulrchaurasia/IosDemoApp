//
//  Extension+UITextField.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 22/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
fileprivate func setPasswordToggleImage(_ button: UIButton) {
    if(isSecureTextEntry){
        button.setImage(UIImage(named: "ic_password_visible"), for: .normal)
    }else{
        button.setImage(UIImage(named: "ic_password_invisible"), for: .normal)

    }
}

func enablePasswordToggle(){
    let button = UIButton(type: .custom)
    setPasswordToggleImage(button)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
    button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
    button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
    self.rightView = button
    self.rightViewMode = .always
}
@IBAction func togglePasswordView(_ sender: Any) {
    self.isSecureTextEntry = !self.isSecureTextEntry
    setPasswordToggleImage(sender as! UIButton)
}
}
