//
//  LoginViewController.swift
//  FirstLoginScreen
//
//  Created by Renato Vieira on 10/07/24.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordEntrySecurityImageView: UIImageView!
    @IBOutlet weak var confirmPasswordEntrySecurityImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configElements()
    }
    
    @IBAction func loginActionButton(_ sender: UIButton) {
        confirmAlert(title: "Sejam bem vindos", message: "Aproveitem nosso app", titleButton: "Ok")
    }
    
    func configElements() {
        self.configLabels()
        self.configTextFields()
        self.configButton()
        self.isEnabledLoginButton(isEnable: false)
        self.configEnableIsSecureTextEntryPassword()
        self.configEnableIsSecureTextEntryConfirmPassword()
    }
    
    func configLabels() {
        nameLabel.text = "Sejam bem Vindos!"
        nameLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    func configTextFields() {
        emailTextField.placeholder = "Digite seu e-mail"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.delegate = self
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1
        
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        
        confirmPasswordTextField.placeholder = "Confime sua senha"
        confirmPasswordTextField.autocorrectionType = .no
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.delegate = self
        confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        confirmPasswordTextField.layer.borderWidth = 1
    }
    
    func configButton() {
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitle("Login", for: .normal)
        loginButton.tintColor = UIColor.white
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 20
    }
    
    func isEnabledLoginButton(isEnable: Bool) {
      loginButton.isEnabled = isEnable
      loginButton.backgroundColor = isEnable ? .systemBlue : .lightGray
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPred.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        let passwordPattern = ".{6,}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPred.evaluate(with: password)
    }
    
    func validateEqualsPassword() -> Bool {
        if passwordTextField.text == confirmPasswordTextField.text {
            return true
        } else {
            return false
        }
    }
    
    func configEnableIsSecureTextEntryPassword() {
        passwordEntrySecurityImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        passwordEntrySecurityImageView.addGestureRecognizer(tapGesture)
    }
            
    @objc func imageTapped() {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            passwordEntrySecurityImageView.image = UIImage(named: "eye")
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordEntrySecurityImageView.image = UIImage(named: "eye.slash")
        }
    }
    
    func configEnableIsSecureTextEntryConfirmPassword() {
        confirmPasswordEntrySecurityImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(confirmPasswordImageTapped))
        confirmPasswordEntrySecurityImageView.addGestureRecognizer(tapGesture)
    }
            
    @objc func confirmPasswordImageTapped() {
        if confirmPasswordTextField.isSecureTextEntry == true {
            confirmPasswordTextField.isSecureTextEntry = false
        } else {
            confirmPasswordTextField.isSecureTextEntry = true
        }
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
          let newText = text.replacingCharacters(in: range, with: string)
          textField.text = newText
            if isValidEmail(emailTextField.text ?? "") && isValidPassword(passwordTextField.text ?? "") && isValidPassword(confirmPasswordTextField.text ?? "") && validateEqualsPassword() {
            isEnabledLoginButton(isEnable: true)
          } else {
            isEnabledLoginButton(isEnable: false)
          }   
        }
        return false
    }
}

