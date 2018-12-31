//
//  UserController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


class UserController {
    // Methods for User
    
    static let shared = UserController()
    
    func fetchCurrentUser(userId: String, completion: @escaping (User, Error?) -> Void) {
    }
    
    func signUp(username: String, email: String, password: String, completion: @escaping (Error?) -> Void){
        var request = URLRequest(url: baseUrl!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.post.rawValue
        let userCredentials = ["username": username, "email": email, "password": password] as [String: Any]
        let userDictionary = ["user": userCredentials] as [String: Any]
        do {
            let json = try JSONSerialization.data(withJSONObject: userDictionary, options: .prettyPrinted)
            request.httpBody = json
            completion(nil)
        } catch {
            NSLog("Error encoding JSON")
            completion(error)
        }
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if let error = error {
                NSLog("There was an error signup up the user: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    NSLog("Error code from the http request: \(httpResponse.statusCode)")
                    completion(error)
                    return
                }
            }
            
            NSLog("Successfully signed up User")
            
            
        }.resume()
    }
    
    static func logIn(email: String, password: String) {
    }
    
    static func logout() {
        
    }
    
    var baseUrl = URL(string: "http://192.168.1.152:3000/api/users")
    var currentUser: User!
    
}
