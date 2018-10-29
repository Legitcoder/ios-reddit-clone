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
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if let error = error {
                NSLog("Error creating user: \(error)")
            }
            NSLog("User Created")
        }
    }
    
}
