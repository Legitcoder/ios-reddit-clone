//
//  PostController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation

class PostController {
    func createPost(title: String, body: String, user: User) {
        let post =  Post(title: title, body: body, user: user)
    }
    func updatePost(title: String, body: String, user: User, post: Post) {
        guard let index = posts.index(of: post) else { return }
        posts[index].title = title
        posts[index].body = body
    }
    
    
    func getPosts(completion: @escaping (Error?) -> Void) {
        
    }
    
    var baseUrl = URL(string: "http://localhost:3000/api/posts")
    var posts: [Post] = []
}
