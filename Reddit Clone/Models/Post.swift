//
//  Post.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


struct Post {
    let id: String = UUID().uuidString
    var title: String
    var body: String
}
