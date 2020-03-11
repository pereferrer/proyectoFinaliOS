//
//  LoginRegisterImpl.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 29/02/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

class LoginRegisterImpl: LoginRegisterRepository{
   
    let session: SessionAPI
    
    init(session: SessionAPI) {
        self.session = session
    }
    
    func createNewUser(name: String, email: String, password: String, username: String, completation: @escaping (Result<NewUserResponse, ApiErrorResponse>) -> ()) {
        
        let request = NewUserRequest(name: name, email: email, password: password, username: username)
        session.send(request: request){result in
            completation(result)
        }
    }
    
    func loginUser(username: String, password:String, completation: @escaping (Result<LoginResponse, ApiErrorResponse>) -> ()) {
        let request = LoginUserRequest(username: username, password: password)
        session.send(request: request){result in
            completation(result)
        }
    }
    
    func forgotPasswordUser(login: String, completation: @escaping (Result<ForgotPasswordResponse, ApiErrorResponse>) -> ()) {
        let request = ForgotPasswordRequest(login:login)
        session.send(request: request){result in
            completation(result)
        }
    }
    
    func detailUser(username: String, completation: @escaping (Result<DetailUserResponse, ApiErrorResponse>) -> ()) {
        let request = DetailUserRequest(username: username)
        session.send(request: request){result in
            completation(result)
        }
    }
    
    func privateMessageList(username: String, completation: @escaping (Result<PrivateMessageListResponse, ApiErrorResponse>) -> ()) {
           let request = privateMessageListRequest(username: username)
           session.send(request: request){result in
               completation(result)
           }
       }
}
