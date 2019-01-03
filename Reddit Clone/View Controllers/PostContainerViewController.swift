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
    }
    

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var StackViewHC: NSLayoutConstraint!
    
    override func viewDidAppear(_ animated: Bool) {
        updateViews()
    }
    
    override func viewDidLayoutSubviews() {
        view.layer.addBorder(edge: .bottom, color: .white, thickness: 1)
    }
    
    func updateViews() {
        guard let post = post, isViewLoaded else { return }
        
        let currentUserName = UserDefaults.standard.username
        
        usernameLabel.text = post.user.username
        postTitleLabel.text = post.title
        postBodyTextView.text = post.body
//        postBodyTextView.frame = CGRect(x: postBodyTextView.frame.origin.x, y: postBodyTextView.frame.origin.y, width: postBodyTextView.frame.width, height: postBodyTextView.frame.height + postTitleLabel.frame.height + usernameLabel.frame.height)
        postBodyTextView.backgroundColor = Appearance.darkGray
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditPost" {
            guard let destination = segue.destination as? PostDetailViewController else { return }
            destination.post = post
        }
    }
  
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyTextView: UITextView!
    
    
    @IBAction func editPost(_ sender: Any) {
    }
    @IBOutlet weak var editPostButton: UIButton!
    
    @IBOutlet weak var postStackView: UIStackView!
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    var currentUser: User?
}
