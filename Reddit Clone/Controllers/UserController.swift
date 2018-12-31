//
//  UserController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation
import JWTDecode

class UserController {
    // Methods for User
    
    static let shared = UserController()
    
    func fetchCurrentUser(userId: String, completion: @escaping (User, Error?) -> Void) {
    }
    
    func signUp(username: String, email: String, password: String, completion: @escaping (Error?) -> Void){
        let url = baseUrl.appendingPathComponent("users")
        var request = URLRequest(url: url)
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
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                NSLog("Error code from the http request: \(httpResponse.statusCode)")
                completion(error)
                return
            }
            
            NSLog("Successfully signed up User")
            
            self.logIn(username: username, password: password)
            
            completion(nil)
            
        }.resume()
    }
    
    func logIn(username: String, password: String, completion: @escaping (Error?) -> Void = {_ in }) {
        let url = baseUrl.appendingPathComponent("tokens")
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.post.rawValue
        let userCredentials = ["username": username, "password": password] as [String: Any]
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
                NSLog("There was an error logging in the user: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    NSLog("Error code from the http request: \(httpResponse.statusCode)")
                    completion(error)
                    return
            }
            
            do {
                let token = try JSONDecoder().decode(JWT.self, from: data)
                let jwt = try decode(jwt: token.jwt)
                let userId = jwt.body["id"] as! Int
                let username = jwt.body["username"] as! String
                guard let signature = jwt.signature else {
                    NSLog("Missing JWT Signature when logging in")
                    return
                }
                self.saveCurrentUser(userId: userId, username: username, signature: signature)
            } catch {
                NSLog("Error decoding JSON Web Token \(error)")
                completion(error)
                return
            }
            
            NSLog("Successfully logged in User")
        }.resume()
    }
    
    private func saveCurrentUser(userId: Int, username: String, signature: String) {
        UserDefaults.standard.set(signature, forKey: UserDefaultsKeys.jwtSignature.rawValue)
        UserDefaults.standard.set(userId, forKey: UserDefaultsKeys.userId.rawValue)
        UserDefaults.standard.set(username, forKey: UserDefaultsKeys.username.rawValue)
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func logout() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
    var baseUrl = URL(string: "http://192.168.1.152:3000/api")!
    var currentUser: User!
    
}
