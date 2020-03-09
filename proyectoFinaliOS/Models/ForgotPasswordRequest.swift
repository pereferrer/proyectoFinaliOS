//
//  ForgotPasswordRequest.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 09/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct ForgotPasswordRequest: APIRequest {
    
    typealias Response = ForgotPasswordResponse
    
    let login: String
    
    init(login:String){
        self.login = login
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/session/forgot_password"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return ["login":login]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
