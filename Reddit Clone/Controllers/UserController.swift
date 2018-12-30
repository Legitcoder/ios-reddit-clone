//
//  UserController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    // Methods for User
    
    let ref: DatabaseReference!
    
    init() {
        self.ref = Database.database().reference()
        self.currentUser = nil
    }
    
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
