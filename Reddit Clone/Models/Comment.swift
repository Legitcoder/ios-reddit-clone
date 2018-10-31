//
//  Comment.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


struct Comment {
    let id: String
    var body: String
    let user: User
    let post: Post
    
    init(id: String = UUID().uuidString, body: String, user: User, post: Post) {
        self.id = id
        self.user = user
        self.body = body
        self.post = post
    }
}
