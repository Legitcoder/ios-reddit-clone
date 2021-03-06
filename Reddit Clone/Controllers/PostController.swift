//
//  PostController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation

class PostController {
    
    static let shared = PostController()
    var token: String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.token.rawValue)
    }
    
    func getPosts(completion: @escaping (Error?) -> Void) {
        var request = URLRequest(url: baseUrl)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.get.rawValue
        guard let token = token else {
            NSLog("No JWT Token Set to User Defaults")
            return
        }
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if let error = error {
                NSLog("There was an error getting all the posts: \(error)")
                completion(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                NSLog("Error code from the http request: \(httpResponse.statusCode)")
                completion(error)
                return
            }
            guard let data = data else {
                NSLog("Error retreiving Data")
                return
            }
            
            do {
                self.posts = try JSONDecoder().decode([Post].self, from: data)
            } catch {
                NSLog("Error Decoding Posts JSON \(error)")
                return
            }
            
            NSLog("Successfully fetched all posts")
            
            
            completion(nil)
            
            }.resume()
        
    }
    
    func getPostComments(post: Post, completion: @escaping (Error?) -> Void) {
        let url = baseUrl.appendingPathComponent("\(post.id)")
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.get.rawValue
        guard let token = token else {
            NSLog("No JWT Token Set to User Defaults")
            return
        }
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if let error = error {
                NSLog("There was an error getting all the comments of post: \(error)")
                completion(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                NSLog("Error code from the http request: \(httpResponse.statusCode)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("Error retreiving Data")
                return
            }
            
            do {
                self.comments = try JSONDecoder().decode([Comment].self, from: data)
            } catch {
                NSLog("Error Decoding Comments JSON \(error)")
                return
            }
            
            NSLog("Successfully fetched all comments of Post")
            
            
            completion(nil)
            
            }.resume()
        
    }
    
    func clearComments() {
        comments.removeAll()
    }
    
    func createPost(title: String, body: String, completion: @escaping (Error?) -> Void) {
        var request = URLRequest(url: baseUrl)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.post.rawValue
        let post = ["title": title, "body": body] as [String: Any]
        let postDictionary = ["post": post] as [String: Any]
        guard let token = token else {
            NSLog("No JWT Token Set to User Defaults")
            return
        }
        request.setValue(token, forHTTPHeaderField: "Authorization")
        do {
            let json = try JSONSerialization.data(withJSONObject: postDictionary, options: .prettyPrinted)
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
            
            NSLog("Successfully created a post")
            
            
            completion(nil)
            
            }.resume()
    }
    
    
    
    var baseUrl = URL(string: "http://localhost:3000/api/posts")!
    var posts: [Post] = []
    var comments: [Comment] = []
}
