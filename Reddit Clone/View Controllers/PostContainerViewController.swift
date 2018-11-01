//
//  PostContainerViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/31/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class PostContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        view.backgroundColor = Appearance.darkGray
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        view.layer.addBorder(edge: .bottom, color: .white, thickness: 1)
    }
    
    func updateViews() {
        guard let post = post, let currentUser = currentUser, isViewLoaded else { return }
        
        if post.user.username != currentUser.username {
            editPostButton.isHidden = true
        }
        usernameLabel.text = post.user.username
        postTitleLabel.text = post.title
        postBodyTextView.text = post.body
        postBodyTextView.backgroundColor = Appearance.darkGray
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditPost" {
            guard let destination = segue.destination as? PostDetailViewController else { return }
            destination.post = post
            destination.currentUser = currentUser
        }
    }
  
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyTextView: UITextView!
    
    
    @IBAction func editPost(_ sender: Any) {
    }
    @IBOutlet weak var editPostButton: UIButton!
    
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    var currentUser: User?
}
