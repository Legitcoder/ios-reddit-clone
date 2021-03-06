//
//  LogInViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeTextFieldHeight(textField: usernameTextField, height: 50)
        changeTextFieldHeight(textField: passwordTextField, height: 50)
    }
    
    func changeTextFieldHeight(textField: UITextField, height: CGFloat) {
        textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: height))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBAction func handleDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logIn(_ sender: Any) {
        guard let username = usernameTextField.text,
            let password = passwordTextField.text else { return }
        UserController.shared.logIn(username: username, password: password) { (_) in
            
        }
        dismiss(animated: true, completion: nil)
    }

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
}
