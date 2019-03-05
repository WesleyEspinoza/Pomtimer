//
//  LoginExt.swift
//  PomTime
//
//  Created by Wesley Espinoza on 2/26/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    func setupViews() {
        navigationController?.navigationBar.isHidden = true
        loginBox.translatesAutoresizingMaskIntoConstraints = false
        loginTitle.translatesAutoresizingMaskIntoConstraints = false
        emailTextBox.translatesAutoresizingMaskIntoConstraints = false
        passwordTextBox.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backGroundImageView)
        view.addSubview(loginBox)
        view.addSubview(loginTitle)
        view.addSubview(emailTextBox)
        view.addSubview(passwordTextBox)
        view.addSubview(loginButton)
        view.addSubview(registerButton)

        
        
        NSLayoutConstraint.activate([
            loginBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            loginBox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            loginBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            
            
            loginTitle.topAnchor.constraint(equalTo: loginBox.safeAreaLayoutGuide.topAnchor, constant: 75),
            loginTitle.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant:0 ),
            loginTitle.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant:0 ),
            
            
            emailTextBox.topAnchor.constraint(equalTo: loginTitle.safeAreaLayoutGuide.bottomAnchor, constant: 50),
            emailTextBox.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            emailTextBox.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            
            passwordTextBox.topAnchor.constraint(equalTo: emailTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 50),
            passwordTextBox.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            passwordTextBox.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            
            
            loginButton.topAnchor.constraint(equalTo: passwordTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 45),
            loginButton.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            loginButton.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            
            
            registerButton.topAnchor.constraint(equalTo: loginButton.safeAreaLayoutGuide.bottomAnchor, constant: 45),
            registerButton.leadingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            registerButton.trailingAnchor.constraint(equalTo:loginBox.safeAreaLayoutGuide.trailingAnchor, constant: -45)])
    }
}
