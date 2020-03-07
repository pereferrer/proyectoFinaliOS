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
    
    init(router: LoginRouter,
         registerRepository: LoginRegisterRepository){
        self.router = router
        self.registerRepository = registerRepository
    }
    
    func didTapInLogin(password:String, username:String){
        registerRepository.loginUser(username: username, password: password){[weak self] result in
            switch result{
            case .success:
                self?.view?.loginSuccessfully()
            case .failure(let value):
                self?.view?.showError(with: value.errors.joined(separator: ","))
            }
        }
    }
    
    func didTapInCreateAccount() {
        router.navigateToCreateAccount()
    }
}
