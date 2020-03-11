//
//  DetailUserViewModel.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 10/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

class DetailUserViewModel{
    weak var view: DetailUserViewControllerProtocol?
    let router: DetailUserRouter
    let registerRepository: LoginRegisterRepository
    
    init(router: DetailUserRouter,
         registerRepository: LoginRegisterRepository){
        self.router = router
        self.registerRepository = registerRepository
    }
    
    func getDetailUser(username:String){
        registerRepository.detailUser(username: username){[weak self] result in
            switch result{
            case .success(let value):
                self?.view?.showDetailUserSuccessfully(detailUser: value)
                print("Datos recuperados")
            case .failure(let value):
                self?.view?.showError(with: value.errors.joined(separator: ","))
                print("Datos NO recuperados")
            }
        }
    }
    
    func getPrivateMessageList(username:String){
        registerRepository.privateMessageList(username: username){[weak self] result in
            switch result{
            case .success(let value):
                self?.view?.showPrivateMessage(privateMessageList: value)
                print("Mensajes recuperados")
            case .failure(let value):
                self?.view?.showError(with: value.errors.joined(separator: ","))
                print("Mensajes NO recuperados")
            }
        }
    }
}
