//
//  DetailUserResponse.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 10/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct DetailUserResponse: Codable {
   
    let user: User
        
    enum CodingKeys: String, CodingKey {
        case user = "user"
    }
}
