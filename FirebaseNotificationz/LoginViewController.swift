//
//  LoginViewController.swift
//  FirebaseNotificationz
//
//  Created by Kelvin Lau on 2016-10-23.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
  @IBOutlet fileprivate var emailTextField: UITextField!
  @IBOutlet fileprivate var passwordTextField: UITextField!
}

// MARK: - SegueHandlerType
extension LoginViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case showPosts
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .showPosts:
      break
    }
  }
}

// MARK: - @IBActions
private extension LoginViewController {
  @IBAction func loginButtonTapped() {
    guard let email = emailTextField.text, let password = passwordTextField.text else { fatalError() }
    Server.login(withEmail: email, password: password) { authResponse in
      switch authResponse {
      case .success:
        self.performSegue(withIdentifier: .showPosts, sender: nil)
      case let .failure(message):
        print("failed to log in: \(message)")
      }
    }
  }
  
  @IBAction func createAccountButtonTapped() {
    guard let email = emailTextField.text, let password = passwordTextField.text else { fatalError() }
    Server.createAccount(withEmail: email, password: password) { authResponse in
      switch authResponse {
      case .success:
        print("successfully created account!")
      case let .failure(message):
        print("failed to create account: \(message)")
      }
    }
  }
}
