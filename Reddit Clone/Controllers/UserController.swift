//
//  UserController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


class UserController {
    // Methods for User
    
    func fetchCurrentUser(userId: String, completion: @escaping (User, Error?) -> Void) {
    }
    
    static func createUser(username: String, email: String, password: String, completion: @escaping (Error?) -> Void) {
        
    }
    
    static func logIn(email: String, password: String) {
    }
    
    static func logout() {
        
    }
    
    var baseUrl = URL(string: "http://localhost:3000/api/users")
    var currentUser: User!
    
}
