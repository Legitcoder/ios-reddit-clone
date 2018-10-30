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
}
