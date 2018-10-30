//
//  PostCollectionViewCell.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/30/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    
    func updateViews() {
        
        guard let post = post else { return }
        userLabel.text = post.user.username
        postTitleLabel.text = post.title
        postBodyTextView.text = post.body
    }
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyTextView: UITextView!
    
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
}
