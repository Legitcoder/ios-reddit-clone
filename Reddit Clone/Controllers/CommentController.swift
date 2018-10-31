//
//  CommentController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation
import Firebase

class CommentController {
    let ref: DatabaseReference!
    
    init() {
        self.ref = Database.database().reference()
    }
    
    func createComment(body: String, user: User, post: Post) {
        let comment = Comment(body: body, user: user, post: post)
        comments.append(comment)
        //Save User to Firebase DataBase
        ref.child("comments").child(post.id).setValue([ "id": comment.id, "body": comment.body ])
        ref.child("commentUsers").child(comment.id).child(user.id).setValue([ "id": user.id, "username": user.username, "email": user.email ])
        ref.child("postComments").child(post.id).child(comment.id).setValue([ "id": comment.id, "body": comment.body ])
    }
    
    func convertCommentDictionaryToPost(commentDictionary: [String: Any], post: Post, user: User) -> Comment? {
        guard let id = commentDictionary["id"] as? String else { return nil }
        guard let body = commentDictionary["body"] as? String else { return nil }
        return Comment(id: id, body: body, user: user, post: post)
    }
    
    func convertUserDictionaryToUser(userDictionary: [String: Any]) -> User? {
        guard let username = userDictionary["username"] as? String else { return nil }
        guard let email = userDictionary["email"] as? String else { return nil }
        guard let id = userDictionary["id"] as? String else { return nil }
        return User(id: id, email: email, username: username)
    }
    
    func getCommentsOfPost(post: Post, completion: @escaping (Error?) -> Void) {
        ref.child("postComments").child(post.id).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let commentsDictionaries = (snapshot.value as? [String : [String : Any]]).map({ $0 })?.values else { return }
            for commentDictionary in commentsDictionaries {
                guard let commentId = commentDictionary["id"] as? String else { return }
                self.ref.child("commentUsers").child(commentId).observeSingleEvent(of: .value) { (snapshot) in
                    guard let firebaseUser = (snapshot.value as? [String : [String : Any]]).map({ $0 })?.values.first else { return }
                    guard let user = self.convertUserDictionaryToUser(userDictionary: firebaseUser) else { return }
                    guard let comment = self.convertCommentDictionaryToPost(commentDictionary: commentDictionary, post: post, user: user) else { return }
                    self.comments.append(comment)
                    print("Total Comments: \(self.comments.count)")
                    completion(nil)
                }
            }
        })
    }
    
    var comments: [Comment] = []
}
