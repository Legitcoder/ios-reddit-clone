//
//  CommentDetailViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/31/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class CommentDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        commentBodyTextView.backgroundColor = Appearance.lightGray
        view.backgroundColor = Appearance.darkGray
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addComment(_ sender: Any) {
        guard let body = commentBodyTextView.text,
            let post = post else { return }
        let userId = UserDefaults.standard.userId
        CommentController.shared.createComment(postId: post.id, userId: userId, body: body) { (_) in
            
        }
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

    @IBOutlet weak var commentBodyTextView: UITextView!
    
    
    var commentController: CommentController?
    var currentUser: User?
    var post: Post?

}
