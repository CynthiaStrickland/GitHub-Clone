//
//  RepoTableViewController.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/13/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class RepoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var repoTableView: UITableView!
    @IBOutlet weak var repoSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repoSearchBar.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        return
    }
}

extension RepoTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(repoSearchBar: UISearchBar) {
        
        GithubService.repositoriesForSearchTerm(repoSearchBar.text!)
    }
    
}