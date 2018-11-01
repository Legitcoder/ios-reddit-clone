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
    
    func updateViews() {
        guard let post = post, isViewLoaded else { return }
        usernameLabel.text = post.user.username
        postTitleLabel.text = post.title
        postBodyTextView.text = post.body
        postBodyTextView.backgroundColor = Appearance.darkGray
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyTextView: UITextView!
    
    
    
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
}
