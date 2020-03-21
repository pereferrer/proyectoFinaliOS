//
//  SingleTopicRequest.swift
//  Eh-Ho
//
//  Created by Pere Josep Ferrer Ventura on 23/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

struct SingleTopicRequest: APIRequest {
    
    typealias Response = SingleTopicResponse
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/t/\(id).json"
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

struct SingleTopicRequestPagination: APIRequest {
    
    typealias Response = SingleTopicPaginationResponse
    
    let id: Int
    let posts: [String:String]
    
    init(id: Int, posts:[String:String]) {
        self.id = id
        self.posts = posts
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/t/\(id)/posts.json"
    }
    
    var parameters: [String : String] {
        return self.posts// return ["post_ids[]":"712,713"]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
