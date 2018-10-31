//
//  PostsTableViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/30/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit
import Firebase

class PostsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Posts", style: .plain, target: nil, action: nil)
        getUser()
        getPosts()
    }
    
    @IBAction func logOut(_ sender: Any) {
        UserController.logout()
        dismiss(animated: true, completion: nil)
    }

    
    func getPosts() {
        postController.getPosts { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func getUser() {
        guard let user = Auth.auth().currentUser else {
            NSLog("Error retreiving Current User)")
            return
        }
        userController.fetchCurrentUser(userId: user.uid) { (user, _) in
            DispatchQueue.main.async {
                self.currentUser = user
                self.title = user.username
            }
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postController.posts.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let post = postController.posts[indexPath.row]
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
            let post = postController.posts[indexPath.row]
            destination.post = post
            destination.userController = userController
            destination.postController = postController
            destination.currentUser = currentUser
        } else if segue.identifier == "NewPost" {
             guard let destination = segue.destination as? PostDetailViewController else { return }
            destination.currentUser = userController.currentUser
            destination.postController = postController
        }
        
    }
 
    let userController = UserController()
    let postController = PostController()
    var currentUser: User?
}
