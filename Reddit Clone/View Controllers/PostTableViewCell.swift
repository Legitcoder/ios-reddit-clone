//
//  PostTableViewCell.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/30/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    func updateViews() {
        guard let post = post else { return }
        usernameLabel.text = post.user.username
        postTitleLabel.text = post.title
        postBodyTextView.textContainer.maximumNumberOfLines = 10
        postBodyTextView.textContainer.lineBreakMode = .byTruncatingTail
        postBodyTextView.backgroundColor = Appearance.darkGray
        postBodyTextView.text = post.body
    }
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyTextView: UITextView!
    
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }

}
