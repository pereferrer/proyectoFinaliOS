//
//  LoginResponse.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 07/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
   
    let user: User
        
    enum CodingKeys: String, CodingKey {
        case user = "user"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username: String
    let name: String
    let avatarTemplate: String
    let email: String
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case avatarTemplate = "avatar_template"
        case email
    }
}
