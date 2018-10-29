//
//  User.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


struct User {
    let id: String = UUID().uuidString
    var email: String
    let username: String
    var password: String
}
