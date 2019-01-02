//
//  CommentController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


class CommentController {
    
    static let shared = CommentController()
    
    func createComment(postId: Int, userId: Int, body: String, completion: @escaping (Error?) -> Void) {
        var request = URLRequest(url: baseUrl)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.post.rawValue
        let comment = ["body": body, "post_id": postId, "user_id": userId ] as [String: Any]
        let commentDictionary = ["comment": comment] as [String: Any]
        guard let token = UserDefaults.standard.token else {
            NSLog("No JWT Token Set to User Defaults")
            return
        }
        request.setValue(token, forHTTPHeaderField: "Authorization")
        do {
            let json = try JSONSerialization.data(withJSONObject: commentDictionary, options: .prettyPrinted)
            request.httpBody = json
            completion(nil)
        } catch {
            NSLog("Error encoding JSON")
            completion(error)
        }
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if let error = error {
                NSLog("There was an error creating a post: \(error)")
                completion(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                NSLog("Error code from the http request: \(httpResponse.statusCode)")
                completion(error)
                return
            }
            
            NSLog("Successfully created a comment on Post")
            
            
            completion(nil)
            
            }.resume()
    }
    
    

    var baseUrl = URL(string: "http://localhost:3000/api/comments")!
}
