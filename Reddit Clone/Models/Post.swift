//
//  Post.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


struct Post {
    let id: String
    var title: String
    var body: String
    let user: User
    
    init(id: String = UUID().uuidString, title: String, body: String, user: User) {
        self.id = id
        self.title = title
        self.body = body
        self.user = user
    }
}
