//
//  RegisterViewController.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 02/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailtText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    
    let registerViewModel: RegisterViewModel
    
    init(registerViewModel: RegisterViewModel){
        self.registerViewModel = registerViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUp(_ sender: Any) {
        if(isTextFieldNotNil(textfield: nameText)){
            if(isTextFieldNotNil(textfield: emailtText)){
                if(isTextFieldNotNil(textfield: passwordText) && isPasswordLenghCorrect(texfield: passwordText)){
                    if(isTextFieldNotNil(textfield: usernameText)){
                        self.registerViewModel.didTapInRegisterNewUser(name: nameText.text!, email: emailtText.text!, password: passwordText.text!, username: usernameText.text!)
                    }else{
                        showAlertView(message: "Username cannot be empty", isError:true)
                    }
                }else{
                    showAlertView(message: "Password cannot be empty and at least ten characters", isError:true)
                }
            }else{
                showAlertView(message: "Email cannot be empty", isError:true)
            }
        }else{
            showAlertView(message: "Name cannot be empty", isError:true)
        }
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

protocol RegisterViewControllerProtocol: class {
    func showRegisterUserSuccessfully()
    func showError(with message: String)
}

extension RegisterViewController: RegisterViewControllerProtocol{
    func showRegisterUserSuccessfully() {
        showAlertView(message: "", isError:false)
    }
    
    func showError(with message: String) {
        showAlertView(message: message, isError: true)
    }
}


extension RegisterViewController{
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
