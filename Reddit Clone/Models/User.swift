//
//  User.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


struct User: Codable {
    var id: String
    var email: String
    var username: String
    var password: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case username
        case password
    }
}

struct JWT: Codable {
    var jwt: String
    
    enum CodingKeys: String, CodingKey {
        case jwt
    }
}
