//
//  NewUserRequest.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 29/02/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct NewUserRequest: APIRequest {
    
    typealias Response = NewUserResponse
    
    let name: String
    let email: String
    let password: String
    let username: String
    
    init(name: String, email:String, password:String, username:String){
        self.name = name
        self.email = email
        self.password = password
        self.username = username
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/users"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        print("n \(name)")
        return ["name": name, "email": email, "password": password, "username":username]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
