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
    
    func createUser(username: String, email: String, password: String, completiton: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if let error = error {
                NSLog("Error creating user: \(error)")
                completiton(error)
            }
            NSLog("User Created")
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if error == nil {
                    NSLog("User display name changed!")
                }
            })
        }
        let user = User(email: email, username: username, password: password)
        users.append(user)
        completiton(nil)
    }
    
    static func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error {
                NSLog("Error Signing in \(error)")
            }
            NSLog("Successfully Logged In")
        }
    }
    
    static func logout() {
        try! Auth.auth().signOut()
    }
    
    var users: [User] = []
    
}
