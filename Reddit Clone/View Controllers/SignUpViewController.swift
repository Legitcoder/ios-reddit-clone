//
//  SignUpViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/28/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeTextFieldHeight(textField: usernameTextField, height: 50)
        changeTextFieldHeight(textField: emailTextField, height: 50)
        changeTextFieldHeight(textField: passwordTextField, height: 50)
        // Do any additional setup after loading the view.
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
    
    @IBAction func createAccount(_ sender: Any) {
        guard let username = usernameTextField.text,
        let email = emailTextField.text,
        let password = passwordTextField.text else { return }
        UserController.shared.signUp(username: username, email: email, password: password, completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        })

    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

}
