//
//  LoginUserRequest.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 07/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct LoginUserRequest: APIRequest {
    
    typealias Response = LoginResponse
    
    let username: String
    let password: String
    
    init(username:String, password:String){
        self.username = username
        self.password = password
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/session"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return ["login":username, "password":password]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
