//
//  PostDetailViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/31/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        postBodyTextView.backgroundColor = Appearance.lightGray
        view.backgroundColor = Appearance.darkGray
        updateViews()
        setPlaceholdersLightGray()
    }
    
    func setPlaceholdersLightGray() {
        postTitleTextField .setValue(UIColor.lightGray, forKeyPath: "_placeholderLabel.textColor")
        postBodyTextView.delegate = self
        postBodyTextView.text = "Body:"
        postBodyTextView.textColor = .lightGray
        postBodyTextView.becomeFirstResponder()
        postBodyTextView.selectedTextRange = postBodyTextView.textRange(from: postBodyTextView.beginningOfDocument, to: postBodyTextView.beginningOfDocument)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText:String = postBodyTextView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {
            
            postBodyTextView.text = "Body:"
            postBodyTextView.textColor = UIColor.lightGray
            
            postBodyTextView.selectedTextRange = postBodyTextView.textRange(from: postBodyTextView.beginningOfDocument, to: postBodyTextView.beginningOfDocument)
        }
            
            // Else if the text view's placeholder is showing and the
            // length of the replacement string is greater than 0, set
            // the text color to black then set its text to the
            // replacement string
        else if postBodyTextView.textColor == UIColor.lightGray && !text.isEmpty {
            postBodyTextView.textColor = .white
            postBodyTextView.text = text
        }
            
            // For every other case, the text should change with the usual
            // behavior...
        else {
            return true
        }
        
        // ...otherwise return false since the updates have already
        // been made
        return false
    }

    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if postBodyTextView.textColor == UIColor.lightGray {
                postBodyTextView.selectedTextRange = postBodyTextView.textRange(from: postBodyTextView.beginningOfDocument, to: postBodyTextView.beginningOfDocument)
            }
        }
    }
    
    private func updateViews() {
        if let post = post, isViewLoaded {
            postTitleTextField?.text = post.title
            postBodyTextView?.text = post.body
        }
    }
    
    @IBAction func savePost(_ sender: Any) {
        guard let title = postTitleTextField.text,
            let body = postBodyTextView.text else { return }
        
        if let post = post {
//            postController?.updatePost(title: title, body: body, user: currentUser, post: post)
        } else {
            PostController.shared.createPost(title: title, body: body, completion: { (_) in
            })
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
    
    @IBOutlet weak var postTitleTextField: UITextField!
    @IBOutlet weak var postBodyTextView: UITextView!
    var post: Post? {
        didSet {
         updateViews()
        }
    }
}
