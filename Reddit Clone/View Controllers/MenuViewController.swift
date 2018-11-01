//
//  MenuViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/29/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit
import Firebase
class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        redditSignUpImageView.layer.borderWidth = 5
        redditSignUpImageView.layer.borderColor = UIColor.black.cgColor
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        guard let user = Auth.auth().currentUser else {
            NSLog("Error retreiving Current User)")
            return
        }

        self.performSegue(withIdentifier: "ToPostsViewScreen", sender: self)
    
    }
    @IBOutlet weak var redditTitleLogoImageView: UIImageView!
    
    @IBOutlet weak var redditSignUpImageView: UIImageView!
    
    
}
