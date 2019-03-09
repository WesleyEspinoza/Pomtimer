//
//  ViewController.swift
//  PomTime
//
//  Created by Wesley Espinoza on 2/23/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.


import UIKit
import Foundation
import Firebase

class LoginViewController: UIViewController {
    
    
    let backGroundImageView: UIImageView = {
       let view = UIImageView(frame: UIScreen.main.bounds)
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.image = UIImage(named: "loginBackground")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let loginBox: UIView  = {
        let box = UIView()
        box.backgroundColor = .clear
        box.layer.cornerRadius = 15
        return box
    }()
    
    let loginTitle: UILabel = {
       let label = UILabel()
        label.text = "Login"
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
        box.layer.masksToBounds = true
        box.heightAnchor.constraint(equalToConstant: 40).isActive = true
        box.borderStyle = UITextField.BorderStyle.none
        
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
       return box
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Thonburi", size: 25)
        button.setTitle("Login", for: .normal)
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
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Thonburi", size: 25)
        
        button.setTitle("register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.alpha = 0.7
        button.layer.borderColor = UIColor(hexString: "#000000", alpha: 0.3).cgColor
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
       setupViews()
    }
    
    
    @objc func loginPressed(){
        guard let email = self.emailTextBox.text else {return}
        guard let password = self.passwordTextBox.text else {return}
        login(email: email, password: password)
    }
    
    
    
     func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            if (error == nil) {
                let mainVC = MainViewController()
                self?.navigationController?.present(mainVC, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                strongSelf.present(alert, animated: true)
            }
        }
    }
    
    @objc func registerPressed(){
        let registerVC = RegisterViewController()
        navigationController?.present(registerVC, animated: true, completion: nil)
    }
    
    
}
