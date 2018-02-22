//
//  LoginView.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/12/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    lazy var emailTextField: UITextField = {
       let etf = UITextField()
        etf.placeholder = "Email"
        etf.borderStyle = .roundedRect
        etf.autocorrectionType = .no
        etf.autocapitalizationType = .none
        return etf
    }()
    
    lazy var emailLabel: UILabel = {
       let el = UILabel()
        el.text = "Email:"
        return el
    }()
    
    lazy var passwordTextField: UITextField = {
        let ptf = UITextField()
        ptf.placeholder = "Password"
        ptf.borderStyle = .roundedRect
        ptf.isSecureTextEntry = true
        return ptf
    }()
    
    lazy var passwordLabel: UILabel = {
        let pl = UILabel()
        pl.text = "Password:"
        return pl
    }()
    
    lazy var loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Log in", for: UIControlState.normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .red
        return button
    }()
    
    lazy var createAccButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: UIControlState.normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .blue
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password", for: UIControlState.normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .purple
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupEmailTextField()
        setupEmailLabel()
        setupPasswordTextField()
        setupPasswordLabel()
        setupLoginButton()
        setupCreateAccButton()
        setupForgotPasswordButton()
    }
    
    private func setupEmailTextField() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupEmailLabel() {
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.trailingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: 10).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
    }
    
    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor ).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        
    }
    
    private func setupPasswordLabel() {
        addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.trailingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: emailLabel.widthAnchor).isActive = true
    }
    
    private func setupLoginButton() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        loginButton.widthAnchor.constraint(equalTo: (passwordTextField.widthAnchor), multiplier: 0.5).isActive = true
    }
    
    private func setupCreateAccButton() {
        addSubview(createAccButton)
        createAccButton.translatesAutoresizingMaskIntoConstraints = false
        createAccButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8).isActive = true
        createAccButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        createAccButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7)
    }
    
    private func setupForgotPasswordButton() {
        addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.topAnchor.constraint(equalTo: createAccButton.bottomAnchor, constant: 8).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

}
