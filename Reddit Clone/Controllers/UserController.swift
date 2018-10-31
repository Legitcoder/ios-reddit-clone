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
        ref.child("users").child(userId).observeSingleEvent(of: .value) { (snapshot) in
            guard let firebaseUser = snapshot.value as? [String: Any] else { return }
            guard let username = firebaseUser["username"] as? String else { return }
            guard let email = firebaseUser["email"] as? String else { return }
            let user = User(id: userId, email: email, username: username)
            self.currentUser = user
            completion(user, nil)
        }
    }
    
    static func createUser(username: String, email: String, password: String, completion: @escaping (Error?) -> Void) {
        var userId: String?
        Auth.auth().createUser(withEmail: email, password: password) { firebaseUser, error in
            if let error = error {
                NSLog("Error creating user: \(error)")
                completion(error)
            }
            guard let firebaseUser = firebaseUser else { return }
            NSLog("User Created")
            userId = firebaseUser.user.uid
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if error == nil {
                    NSLog("User display name changed!")
                }
            })
            
            //Save User to Firebase DataBase
            Database.database().reference().child("users").child(userId!).setValue(["id": userId!, "username": username, "email": email ])
        }

        
        completion(nil)
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
    
    //var users: [User] = []
    var currentUser: User!
    
}
