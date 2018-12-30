//
//  CommentTableViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/30/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class CommentTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //commentController.createComment(body: "This is a comment by moin", user: currentUser! , post: post!)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Comments", style: .plain, target: nil, action: nil)
        guard let post = post else { return }
        commentController.getCommentsOfPost(post: post) { (comments, _) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commentController.comments.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
        let comment = commentController.comments[indexPath.row]
        cell.currentUser = currentUser
        cell.comment = comment
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
        if segue.identifier == "NewComment" {
            guard let destination = segue.destination as? CommentDetailViewController else { return }
            destination.post = post
            destination.currentUser = currentUser
            destination.commentController = commentController
        } else if segue.identifier == "PostViewContainer" {
            guard let destination = segue.destination as? PostContainerViewController else { return }
            destination.post = post
            destination.currentUser = currentUser
            destination.postController = postController
        }
    }

    
    var postController: PostController?
    var userController: UserController?
    let commentController = CommentController()
    var post: Post?
    var currentUser: User?

}
