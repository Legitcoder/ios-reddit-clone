//
//  Comment.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


struct Comment: Codable {
    let id: String
    var body: String
    let user: User
    let post: Post?
    
    enum CodingKeys: String, CodingKey {
        case id
        case body
        case user
        case post
    }
    
    init(id: String = UUID().uuidString, body: String, user: User, post: Post) {
        self.id = id
        self.user = user
        self.body = body
        self.post = post
    }
}
