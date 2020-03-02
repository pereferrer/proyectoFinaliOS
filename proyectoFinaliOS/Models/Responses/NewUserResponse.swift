//
//  NewUserResponse.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 29/02/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct NewUserResponse: Codable {
   
    let success: Bool
    let active: Bool
    let message: String
    let user_id: Int
        
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case active = "active"
        case message = "message"
        case user_id = "user_id"
    }
}
