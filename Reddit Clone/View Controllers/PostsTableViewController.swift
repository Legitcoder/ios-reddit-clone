//
//  PostsTableViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/30/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit


class PostsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Posts", style: .plain, target: nil, action: nil)
        title = UserDefaults.standard.username
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getPosts()
    }
    
    func getPosts() {
        PostController.shared.getPosts { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func logOut(_ sender: Any) {
        UserController.shared.logout()
        guard !UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue) else {
            NSLog("UserDefaults hasn't been cleared. User Still Exists")
            return
        }
            dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PostController.shared.posts.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let post = PostController.shared.posts[indexPath.row]
        cell.post = post
        // Configure the cell...

        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewPost" {
            guard let destination = segue.destination as? CommentTableViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let post = PostController.shared.posts[indexPath.row]
            destination.post = post
        }
    }
 
    let userController = UserController()
    let postController = PostController()
    var currentUser: User?
}
