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
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        guard let user = Auth.auth().currentUser else {
            NSLog("Error retreiving Current User)")
            return
        }

        self.performSegue(withIdentifier: "ToPostsViewScreen", sender: self)
    
    }
}
