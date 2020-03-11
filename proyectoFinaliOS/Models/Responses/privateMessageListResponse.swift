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

struct Topic: Codable {
    
    let id: Int?
    let title: String?
    let fancyTitle: String?
    let slug: String?
    let postsCount: Int?
    let replyCount: Int?
    let highestPostNumber: Int?
    let imageURL: String?
    let createdAt: String?
    let lastPostedAt: String?
    let bumped: Bool?
    let bumpedAt: String?
    let unseen: Bool?
    let lastReadPostNumber: Int?
    let unread: Int?
    let newPosts: Int?
    let pinned: Bool?
    let unpinned: Bool?
    let visible: Bool?
    let closed: Bool?
    let archived: Bool?
    let notificationLevel: Int?
    let bookmarked: Bool?
    let liked: Bool?
    let views: Int?
    let likeCount: Int?
    let hasSummary: Bool?
    let archetype: String?
    let lastPosterUsername: String?
    let categoryID: Int?
    let pinnedGlobally: Bool?
    let bookmarkedPostNumbers: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case fancyTitle = "fancy_title"
        case slug
        case postsCount = "posts_count"
        case replyCount = "reply_count"
        case highestPostNumber = "highest_post_number"
        case imageURL = "image_url"
        case createdAt = "created_at"
        case lastPostedAt = "last_posted_at"
        case bumped
        case bumpedAt = "bumped_at"
        case unseen
        case lastReadPostNumber = "last_read_post_number"
        case unread
        case newPosts = "new_posts"
        case pinned
        case unpinned
        case visible
        case closed
        case archived
        case notificationLevel = "notification_level"
        case bookmarked
        case liked
        case views
        case likeCount = "like_count"
        case hasSummary = "has_summary"
        case archetype
        case lastPosterUsername = "last_poster_username"
        case categoryID = "category_id"
        case pinnedGlobally = "pinned_globally"
        case bookmarkedPostNumbers = "bookmarked_post_numbers"
    }
}
