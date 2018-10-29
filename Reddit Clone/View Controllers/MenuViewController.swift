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
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "ToHomeScreen", sender: self)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
