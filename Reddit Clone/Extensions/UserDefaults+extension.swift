//
//  UserDefaults+extension.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 12/31/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    var userId: Int {
        return integer(forKey: UserDefaultsKeys.userId.rawValue)
    }
    
    var username: String {
        if let username = string(forKey: UserDefaultsKeys.username.rawValue) {
            return username
        } else {
            return "N/A"
        }
    }
    
}
