//
//  LoginViewController.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 07/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let loginViewModel: LoginViewModel

    init(loginViewModel: LoginViewModel){
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loginViewModel.isLogged()
    }

    @IBAction func signIn(_ sender: Any) {
        if(isTextFieldNotNil(textfield: usernameTextField)){
            if(isTextFieldNotNil(textfield: passwordTextField)){
                self.loginViewModel.didTapInLogin(password: passwordTextField.text!, username: usernameTextField.text!)
            }else{
                showAlertView(message: "Password cannot be empty", isError:true)
            }
        }else{
            showAlertView(message: "Email cannot be empty", isError:true)
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        self.loginViewModel.didTapInCreateAccount()
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        if(isTextFieldNotNil(textfield: usernameTextField)){
            self.loginViewModel.didTapInForgotPassword(login: usernameTextField.text!)
        }else{
            showAlertView(message: "Email cannot be empty", isError:true)
        }
    }
    
}

protocol LoginViewControllerProtocol: class {
    func loginSuccessfully()
    func showError(with message: String)
    func recoverPasswordSuccessfully()
}

extension LoginViewController:LoginViewControllerProtocol{
    func recoverPasswordSuccessfully() {
        showAlertView(message: "Recover Password completado correctamente", isError: false)
    }
    
    func loginSuccessfully() {
        self.loginViewModel.toMainView()
    }
    
    func showError(with message: String) {
        showAlertView(message: "Username or password incorrectly", isError: true)
    }
}

extension LoginViewController{
    func isTextFieldNotNil(textfield: UITextField)->Bool{
        return !textfield.text!.isEmpty
    }
    
    func isPasswordLenghCorrect(texfield: UITextField)->Bool{
        return texfield.text!.count >= 10
    }
    
    func showAlertView(message: String, isError:Bool){
        if(isError){
            let alert = AlertViewPresenter(title: "Error", message: message, acceptTitle: "Understood")
            alert.present(in: self){ }
        }else{
            let alert = AlertViewPresenter(title: "User Created", message: "Check your mail to activate the account", acceptTitle: "Understood")
            alert.present(in: self){ }
        }
    }
}
