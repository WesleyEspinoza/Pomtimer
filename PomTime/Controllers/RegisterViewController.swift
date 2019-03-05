//
//  RegisterViewController.swift
//  PomTime
//
//  Created by Wesley Espinoza on 2/26/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    let backGroundImageView: UIImageView = {
        let view = UIImageView(frame: UIScreen.main.bounds)
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.image = UIImage(named: "loginBackground")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let loginBox: UIView  = {
        let box = UIView()
        box.backgroundColor = .black
        box.layer.cornerRadius = 15
        box.alpha = 0
        return box
    }()
    
    let loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.font = UIFont(name: "Thonburi", size: 45)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    let emailTextBox: UITextField = {
        let box = UITextField()
        box.adjustsFontForContentSizeCategory = true
        box.backgroundColor = UIColor(hexString: "#000000", alpha: 0)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        box.setLeftPaddingPoints(5)
        box.keyboardType = .emailAddress
        box.textColor = .white
        box.borderStyle = .roundedRect
        box.layer.borderWidth = 1
        box.layer.borderColor = UIColor(hexString: "#c4c4c4", alpha: 0.3).cgColor
        box.layer.cornerRadius = 5
        box.layer.masksToBounds = false
        box.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return box
    }()
    
    
    let passwordTextBox: UITextField = {
        let box = UITextField()
        box.adjustsFontForContentSizeCategory = true
        box.backgroundColor = UIColor.black
        box.backgroundColor = UIColor(hexString: "#000000", alpha: 0)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        box.setLeftPaddingPoints(5)
        box.keyboardType = .default
        box.isSecureTextEntry = true
        box.textColor = .white
        box.borderStyle = .roundedRect
        box.layer.borderWidth = 1
        box.layer.borderColor = UIColor(hexString: "#c4c4c4", alpha: 0.3).cgColor
        box.layer.cornerRadius = 5
        box.layer.masksToBounds = false
        box.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return box
    }()
    
    let confirmPasswordTextBox: UITextField = {
        let box = UITextField()
        box.adjustsFontForContentSizeCategory = true
        box.backgroundColor = UIColor.black
        box.backgroundColor = UIColor(hexString: "#000000", alpha: 0)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.attributedPlaceholder = NSAttributedString(string: "Confirm Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        box.setLeftPaddingPoints(5)
        box.keyboardType = .default
        box.isSecureTextEntry = true
        box.textColor = .white
        box.borderStyle = .roundedRect
        box.layer.borderWidth = 1
        box.layer.borderColor = UIColor(hexString: "#c4c4c4", alpha: 0.3).cgColor
        box.layer.cornerRadius = 5
        box.layer.masksToBounds = false
        box.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return box
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Thonburi", size: 25)
        
        button.setTitle("create account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.alpha = 0.7
        button.layer.borderColor = UIColor(hexString: "#000000", alpha: 0.3).cgColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.addTarget(self, action: #selector(createAccountPressed), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Thonburi", size: 25)
        
        button.setTitle("⥢", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.alpha = 0.7
        button.layer.borderColor = UIColor(hexString: "#000000", alpha: 0.3).cgColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let confirmPasswordErrorLable: UILabel = {
        let label = UILabel()
        label.isHidden = true
        return label
    }()
    
    let passwordErrorLable: UILabel = {
        let label = UILabel()
        label.isHidden = true
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    
    @objc func createAccountPressed(){
        if emailTextBox.text != nil && passwordTextBox.text != nil {
            createAccount(email: emailTextBox.text!, password: passwordTextBox.text!)
        }
    }
    
    
    @objc func backButtonPressed(){
       self.dismiss(animated: true, completion: nil)
    }
    
    
    
     func createAccount(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if (authResult?.user != nil) {
                self.dismiss(animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}

