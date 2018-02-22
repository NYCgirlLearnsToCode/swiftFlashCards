//
//  ViewController.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/12/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    let authUserService = AuthUserService()
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginView)
        authUserService.delegate = self
        loginView.createAccButton.addTarget(self, action: #selector(createNewAccount), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        loginView.forgotPasswordButton.addTarget(self, action: #selector(sendPasswordReset), for: .touchUpInside)
    }
    
    @objc private func sendPasswordReset() {
        Auth.auth().sendPasswordReset(withEmail: loginView.emailTextField.text!){(error) in
            self.showAlert(title: "Password reset", message: "Password reset email sent. Please check spam folder")}
    }
    
    @objc private func loginUser() {
        guard let emailText = loginView.emailTextField.text else { print("email field is nil");return}
        guard let passwordText = loginView.passwordTextField.text else {print("password is nil"); return}
        authUserService.signIn(email: emailText, password: passwordText)
    }
    
    @objc private func createNewAccount() {
        print("create account button pressed")
        guard let emailText = loginView.emailTextField.text else {
            print("email field is nil"); return}
        guard !emailText.isEmpty else {
            print("email textfield is nil"); return}
        guard let passwordText = loginView.passwordTextField.text else {
            print("password field is nil"); return}
        guard !passwordText.isEmpty else {
            print("password textfield is nil"); return}
        authUserService.createUser(email: emailText, password: passwordText)
        
    }
    
    private func showAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
extension LoginViewController: AuthUserServiceDelegate {
    func didCreateUser(_ userService: AuthUserService, user: User) {
        print("didCreateUser: \(user)")
        Auth.auth().currentUser!.sendEmailVerification(completion: { (error) in
            if let error = error {
                print("error with sending email verification, \(error)")
                self.showAlert(title: "Error", message: "error with sending email verification");
                self.authUserService.signOut()
            } else {
                print("email verification sent")
                self.showAlert(title: "Verification Sent", message: "Please verify email");
                self.authUserService.signOut()
            }
        })
    }
    
    func didFailCreatingUser(_ userService: AuthUserService, error: Error) {
        print("Failed creating user error: \(error.localizedDescription)")
        showAlert(title: "Error creating user", message: "Failed creating user error: \(error.localizedDescription)")
    }
    
    func didSignIn(_ userService: AuthUserService, user: User) {
        if Auth.auth().currentUser?.isEmailVerified == true {
            let categoriesViewController = CategoriesViewController()
            let categoriesNavCon = UINavigationController(rootViewController: categoriesViewController)
            self.dismiss(animated: true, completion: nil)
            present(categoriesNavCon, animated: true, completion: nil)
        }
    }
    
    func didFailSignIn(_ userService: AuthUserService, error: Error) {
       showAlert(title: error.localizedDescription, message: nil)
    }
    
}

