//
//  privateMessageListRequest.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 10/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct privateMessageListRequest: APIRequest {
    
    typealias Response = PrivateMessageListResponse
    
    let username: String
    
    init(username:String){
        self.username = username
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/topics/private-messages/\(self.username).json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
