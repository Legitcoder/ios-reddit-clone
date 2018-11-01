//
//  AppearanceHelper.swift
//  
//
//  Created by Moin Uddin on 11/1/18.
//

import UIKit

enum Appearance {
    static var lightGray = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    static var darkGray = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 34.0/255.0, alpha: 1.0)
    
    static func setDarkAppearance() {
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().largeTitleTextAttributes = attributes
        
        UIBarButtonItem.appearance().tintColor = .white
        
        UINavigationBar.appearance().barTintColor = .black
        
        UITableViewCell.appearance().backgroundColor = darkGray
        UITableView.appearance().backgroundColor = darkGray
        
        UITextView.appearance().backgroundColor = .black
        UITextView.appearance().textColor = .white
        UITextField.appearance().backgroundColor = lightGray
        UITextField.appearance().textColor = .white
        
        UILabel.appearance().textColor = .white
    }
    
    
}
