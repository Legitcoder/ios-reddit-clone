//
//  PostController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation
import Firebase

class PostController {
    
    let ref: DatabaseReference!
    
    init() {
        self.ref = Database.database().reference()
    }
    
    func createPost(title: String, body: String, user: User) {
        let post =  Post(title: title, body: body, user: user)
        posts.append(post)
        //Save User to Firebase DataBase
        ref.child("posts").child(post.id).setValue([ "id": post.id, "title": post.title, "body": post.body ])
        ref.child("postUsers").child(post.id).child(user.id).setValue([ "id": user.id, "username": user.username, "email": user.email ])
    }
    
    func convertPostDictionaryToPost(postDictionary: [String: Any], user: User) -> Post? {
        guard let id = postDictionary["id"] as? String else { return nil }
        guard let title = postDictionary["title"] as? String else { return nil }
        guard let body = postDictionary["body"] as? String else { return nil }
        return Post(id: id, title: title, body: body, user: user)
    }
    
    func convertUserDictionaryToUser
    
    
    func getPosts() {
        ref.child("posts").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let postDictionaries = (snapshot.value as? [String : [String : Any]]).map({ $0 })?.values else { return }
            for postDictionary in postDictionaries {
                guard let postId = postDictionary["id"] as? String else { return }
                self.ref.child("postUsers").child(postId).observeSingleEvent(of: .value) { (snapshot) in
                    
                    guard let firebaseUser = (snapshot.value as? [String : [String : Any]]).map({ $0 })?.values.first else { return }
                    
                    guard let username = firebaseUser["username"] as? String else { return }
                    guard let email = firebaseUser["email"] as? String else { return }
                    guard let id = firebaseUser["id"] as? String else { return }
                    
                    let user = User(id: id, email: email, username: username)
                    guard let post = self.convertPostDictionaryToPost(postDictionary: postDictionary, user: user) else { return }
                    self.posts.append(post)
                }
            }
            
        })
    }
    
    var posts: [Post] = []
}
