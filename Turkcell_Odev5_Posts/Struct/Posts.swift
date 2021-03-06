//
//  Posts.swift
//  Turkcell_Odev5_Posts
//
//  Created by Gulsah Altiparmak on 28.01.2021.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Posts = [Post]


