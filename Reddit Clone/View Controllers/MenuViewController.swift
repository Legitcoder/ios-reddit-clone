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

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        guard let user = Auth.auth().currentUser else {
            NSLog("Error retreiving Current User)")
            return
        }
        performSegue(withIdentifier: "ToPostsViewScreen", sender: self)
    }

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SignUpViewController {
            destination.userController = self.userController
        }
    }

    
    let userController = UserController()

}
