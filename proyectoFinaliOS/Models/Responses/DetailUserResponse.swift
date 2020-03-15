//
//  DetailUserResponse.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 10/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct DetailUserResponse: Codable {
   
    let name: String
    let username: String
    let avatar_template: String
    let last_seen_at: String
    let moderator: Bool
        
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case username = "username"
        case avatar_template = "avatar_template"
        case last_seen_at = "last_seen_at"
        case moderator = "moderator"
    }
}
