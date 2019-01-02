//
//  CommentTableViewCell.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/30/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews() {
        guard let comment = comment else { return }
        let username = UserDefaults.standard.username
        if comment.user.username != username {
            self.isUserInteractionEnabled = false
        }
        usernameLabel.text = comment.user.username
        usernameLabel.textColor = .white
        
        commentBodyTextView.text = comment.body
        commentBodyTextView.backgroundColor = Appearance.darkGray
    }
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentBodyTextView: UITextView!
    
    var comment: Comment? {
        didSet {
            updateViews()
        }
    }
    var currentUser: User?
    
}
