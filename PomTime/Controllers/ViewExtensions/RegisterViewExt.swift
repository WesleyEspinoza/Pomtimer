//
//  RegisterViewExt.swift
//  PomTime
//
//  Created by Wesley Espinoza on 2/26/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

extension RegisterViewController: UITextViewDelegate {
func setupViews() {
    passwordTextBox.addTarget(self, action: #selector(isPasswordValid(_:)), for: .editingChanged)
    confirmPasswordTextBox.addTarget(self, action: #selector(isConfirmPasswordSame(_:)), for: .editingChanged)
    
    
    navigationController?.navigationBar.isHidden = true
    loginBox.translatesAutoresizingMaskIntoConstraints = false
    loginTitle.translatesAutoresizingMaskIntoConstraints = false
    emailTextBox.translatesAutoresizingMaskIntoConstraints = false
    passwordTextBox.translatesAutoresizingMaskIntoConstraints = false
    confirmPasswordTextBox.translatesAutoresizingMaskIntoConstraints = false
    registerButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.translatesAutoresizingMaskIntoConstraints = false
    passwordErrorLable.translatesAutoresizingMaskIntoConstraints = false
    confirmPasswordErrorLable.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(backGroundImageView)
    view.addSubview(loginBox)
    view.addSubview(loginTitle)
    view.addSubview(emailTextBox)
    view.addSubview(passwordTextBox)
    view.addSubview(confirmPasswordTextBox)
    view.addSubview(registerButton)
    view.addSubview(passwordErrorLable)
    view.addSubview(confirmPasswordErrorLable)
    view.addSubview(backButton)
    
    
    
    NSLayoutConstraint.activate([
        loginBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        loginBox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        loginBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
        loginBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
        
        
        
        loginTitle.topAnchor.constraint(equalTo: loginBox.safeAreaLayoutGuide.topAnchor, constant: 45),
        loginTitle.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant:0 ),
        loginTitle.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant:0 ),
        
        
        emailTextBox.topAnchor.constraint(equalTo: loginTitle.safeAreaLayoutGuide.bottomAnchor, constant: 50),
        emailTextBox.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        emailTextBox.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        
        
        passwordTextBox.topAnchor.constraint(equalTo: emailTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 50),
        passwordTextBox.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        passwordTextBox.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        
        
        passwordErrorLable.topAnchor.constraint(equalTo: passwordTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 8),
        passwordErrorLable.leadingAnchor.constraint(equalTo:passwordTextBox.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        passwordErrorLable.trailingAnchor.constraint(equalTo:passwordTextBox.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        
        
        
        confirmPasswordTextBox.topAnchor.constraint(equalTo: passwordTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 50),
        confirmPasswordTextBox.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        confirmPasswordTextBox.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        
        
        confirmPasswordErrorLable.topAnchor.constraint(equalTo: confirmPasswordTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 8),
        confirmPasswordErrorLable.leadingAnchor.constraint(equalTo:confirmPasswordTextBox.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        confirmPasswordErrorLable.trailingAnchor.constraint(equalTo:confirmPasswordTextBox.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        
        
        registerButton.topAnchor.constraint(equalTo: confirmPasswordTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 50),
        registerButton.leadingAnchor.constraint(equalTo:confirmPasswordTextBox.safeAreaLayoutGuide.leadingAnchor, constant: 25),
        registerButton.trailingAnchor.constraint(equalTo:confirmPasswordTextBox.safeAreaLayoutGuide.trailingAnchor, constant: -25),
        
        
        backButton.topAnchor.constraint(equalTo: registerButton.safeAreaLayoutGuide.bottomAnchor, constant: 50),
        backButton.leadingAnchor.constraint(equalTo:registerButton.safeAreaLayoutGuide.leadingAnchor, constant: 25),
        backButton.trailingAnchor.constraint(equalTo:registerButton.safeAreaLayoutGuide.trailingAnchor, constant: -25)])
    }
    
    @objc func isPasswordValid(_ sender: AnyObject?) -> Bool{
        guard let password = sender?.text else{return false}
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        let result = passwordTest.evaluate(with: password)
        
        if result{
            self.passwordErrorLable.text = "All Good!"
            self.passwordErrorLable.textColor = .green
            self.passwordErrorLable.isHidden = false
            
        }else{
            self.passwordErrorLable.text = "8 char & 1 special char"
            self.passwordErrorLable.textColor = .red
            self.passwordErrorLable.isHidden = false
            self.registerButton.isEnabled = false
        }
        return result
    }
    
    
    //confirms the password is the same as above
    @objc func isConfirmPasswordSame(_ sender: AnyObject?) -> Bool{
        guard let password = sender?.text else{return false}
        
        var result = false
        
        if password == passwordTextBox.text {
            self.confirmPasswordErrorLable.text = "All Good!"
            self.confirmPasswordErrorLable.textColor = .green
            self.confirmPasswordErrorLable.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.registerButton.backgroundColor = UIColor.init(hexString: "#2ecc71")
            }
            self.registerButton.isEnabled = true
            result = true
        }else{
            self.confirmPasswordErrorLable.text = "Password are different."
            self.confirmPasswordErrorLable.textColor = .red
            self.confirmPasswordErrorLable.isHidden = false
            self.registerButton.isEnabled = false
            result = false
        }
        return result
    }
    
}


