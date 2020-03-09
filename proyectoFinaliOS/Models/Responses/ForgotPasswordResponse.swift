//
//  ForgotPasswordResponse.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 09/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct ForgotPasswordResponse: Codable {
   
    let success: String
    let user_found: Bool
        
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case user_found = "user_found"
    }
}
