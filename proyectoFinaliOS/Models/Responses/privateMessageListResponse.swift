//
//  privateMessageListResponse.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 10/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

struct PrivateMessageListResponse: Codable {
   
    let topic_list: TopicList
        
    enum CodingKeys: String, CodingKey {
        case topic_list = "topic_list"
    }
}

// MARK: - TopicList
struct TopicList: Codable {

    let topics: [Topic]
    
    enum CodingKeys: String, CodingKey {
        case topics
    }
}
