//
//  CommentController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


class CommentController {
    
    func createComment(body: String, user: User, post: Post) {
        let comment = Comment(body: body, user: user, post: post)
    }
    
    func getCommentsOfPost(post: Post, completion: @escaping ([Comment], Error?) -> Void) {
        
    }

    var baseUrl = URL(string: "http://localhost:3000/api/comments")
    var comments: [Comment] = []
}
