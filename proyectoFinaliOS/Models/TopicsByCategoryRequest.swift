//
//  TopicsByCategoryRequest.swift
//  Eh-Ho
//
//  Created by Pere Josep Ferrer Ventura on 23/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

struct TopicsByCategoryRequest: APIRequest {
    
    typealias Response = TopicsByCategoryResponse
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/latest.json"
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


struct LatestTopicsRequestByPage: APIRequest {
    
    typealias Response = TopicsByCategoryResponse
    let page: String
    let definitions: String
    
    init(page: String, definitions: String) {
        self.page = page
        self.definitions = definitions
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/latest.json"
    }
    
    var parameters: [String : String] {
        return ["no_definitions":self.definitions, "page":self.page]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }

}
