//
//  UserSearchViewController.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/13/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Foundation

class UserSearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageQueue = NSOperationQueue()
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UserSearchCollectionViewCell" {
            var destination = segue.destinationViewController as? ProfileViewController, indexPath = collectionView.indexPathsForSelectedItems()!.first! as NSIndexPath {
                let user = users[indexPath.row]
                destination!.selectedUser = user
            }
        }
    }

    // MARK:   REGEX
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        return true
        
    }
}

extension UserSearchViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        GithubService.userForSearchTerm(searchBar.text!, userSearchCallback: { (errorDescription, users) -> (Void) in
            if let _ = errorDescription {
                
            } else if let users = users {
                self.users = users
                self.collectionView.reloadData()
                
            }
        })
    }
}

extension UserSearchViewController : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserSearchCollectionViewCell", forIndexPath: indexPath) as! UserSearchCollectionViewCell
        
        cell.avatarImage.image = nil
        cell.hidden = false
        cell.alpha = 0
        
        cell.tag++
        let tag = cell.tag
        
        let user = users[indexPath.row]
        
        if let image = user.image {
            cell.avatarImage.image = image
        } else {
            
            ImageService.fetchProfileImage(user.avatarURL, imageQueue: imageQueue, completionHandler: { (image) -> () in
                user.image = image
                self.users[indexPath.row] = user
                if cell.tag == tag {
                    cell.avatarImage.image = user.image
                    
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        cell.alpha = 1
                    })
                }
            })
        }
        return cell
    }
}

