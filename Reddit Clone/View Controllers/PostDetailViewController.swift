//
//  PostDetailViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/31/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePost(_ sender: Any) {
        guard let title = postTitleTextField.text,
            let body = postBodyTextView.text,
            let currentUser = currentUser else { return }
        postController?.createPost(title: title, body: body, user: currentUser)
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
    
    @IBOutlet weak var postTitleTextField: UITextField!
    @IBOutlet weak var postBodyTextView: UITextView!
    
    var postController: PostController?
    var currentUser: User?

}
