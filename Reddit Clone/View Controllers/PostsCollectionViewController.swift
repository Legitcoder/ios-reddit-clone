//
//  PostsCollectionViewController.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 10/29/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit
import Firebase

class PostsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = Auth.auth().currentUser else {
            NSLog("Error retreiving Current User)")
            return
        }
        userController.fetchCurrentUser(userId: user.uid) { (user, _) in
            DispatchQueue.main.async {
                self.currentUser = user
                self.title = user.username
                //self.postController.createPost(title: "This a long title on purpose", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sit amet mi at nunc tristique luctus a in dolor. Etiam placerat maximus urna, eu imperdiet tellus vestibulum et. Pellentesque ac dolor nec erat fringilla porta vel a metus. Phasellus ultricies tellus et convallis eleifend. Vestibulum vestibulum mi volutpat ex hendrerit, vitae pellentesque nisi suscipit. Cras aliquet est nulla, interdum volutpat lorem volutpat eu. Vestibulum feugiat aliquet euismod. Sed dapibus nisl nec dapibus pretium. Nam semper, elit quis commodo sodales, nunc metus rhoncus turpis, eu elementum turpis velit in sem. Quisque consequat posuere lacus, sed pellentesque erat varius egestas. Duis condimentum libero non mauris lacinia, ut volutpat nisl imperdiet.", user: user)
            }
        }
        
        postController.getPosts { (_) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        UserController.logout()
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(postController.posts.count)
        return postController.posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCollectionViewCell
        
        let post = postController.posts[indexPath.item]
        cell.post = post
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
    let userController = UserController()
    let postController = PostController()
    var currentUser: User?
    
}
