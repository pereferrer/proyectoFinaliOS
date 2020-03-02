//
//  RegisterViewModel.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 29/02/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

class RegisterViewModel{
    weak var view: RegisterViewControllerProtocol?
    let router: RegisterRouter
    let registerRepository: LoginRegisterRepository
    
    init(router: RegisterRouter,
         registerRepository: LoginRegisterRepository){
        self.router = router
        self.registerRepository = registerRepository
    }
    
    func didTapInRegisterNewUser(name:String, email:String,
                                 password:String, username:String){
        registerRepository.createNewUser(name: name, email: email, password: password, username: username){[weak self] result in
            switch result{
            case .success:
                self?.view?.showRegisterUserSuccessfully()
            case .failure(let value):
                self?.view?.showError(with: value.errors.joined(separator: ","))
            }
        }
    }
}
