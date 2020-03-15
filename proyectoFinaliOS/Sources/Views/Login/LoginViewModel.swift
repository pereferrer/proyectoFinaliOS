//
//  LoginViewModel.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 07/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

class LoginViewModel{
    weak var view: LoginViewControllerProtocol?
    let router: LoginRouter
    let registerRepository: LoginRegisterRepository
    let dataManager: DataManager
    
    init(router: LoginRouter,
         registerRepository: LoginRegisterRepository,
         dataManager:DataManager){
        self.router = router
        self.registerRepository = registerRepository
        self.dataManager = dataManager
    }
    
    func didTapInLogin(password:String, username:String){
        registerRepository.loginUser(username: username, password: password){[weak self] result in
            switch result{
            case .success(let value):
                self?.dataManager.saveSession(username: value.user.username)
                self?.view?.loginSuccessfully()
            case .failure(let value):
                self?.view?.showError(with: value.errors.joined(separator: ","))
            }
        }
    }
    
    func didTapInCreateAccount() {
        router.navigateToCreateAccount()
    }
    
    func didTapInForgotPassword(login:String){
        registerRepository.forgotPasswordUser(login:login){[weak self] result in switch result{
                   case .success(let value):
                        if value.user_found{
                            self?.view?.recoverPasswordSuccessfully()
                        }else{
                            self?.view?.showError(with: "User not found")
                    }
                   case .failure(let value):
                       self?.view?.showError(with: value.errors.joined(separator: ","))
            }
        }
    }
    
    func toMainView(){
        self.router.navigateToMainView()
    }
}
