//
//  User.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


struct User: Codable {
    let id: String
    var email: String
    let username: String
    var password: String?
    
    init(id: String, email: String, username: String, password: String? = nil) {
        self.id = id
        self.email = email
        self.username = username
        self.password = password
    }
}
