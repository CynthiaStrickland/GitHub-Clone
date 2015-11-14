//
//  RepoTableViewController.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/13/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

//class RepoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    @IBOutlet weak var repoTableView: UITableView!
//    @IBOutlet weak var repoSearchBar: UISearchBar!
//    
//    var tableViewData = [Repository]() {
//        didSet {
//            self.tableViewData.reloadData()
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        repoSearchBar.delegate = self
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.tableViewData.count
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//    let cell = tableView.dequeueReusableCellWithReuseIdentifier("repoSegue", forIndexPath: indexPath) as! RepoTableViewController
//    }
//}
//
//extension RepoTableViewController : UISearchBarDelegate {
//    func searchBarSearchButtonClicked(repoSearchBar: UISearchBar) {
//        
//        GithubService.repositoriesForSearchTerm(repoSearchBar.text!)
//    }
//}