//
//  ViewController.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewData = [Repository]() {
        didSet {
            self.tableView.reloadData()
            searchBar.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Repository.update { (success, repositories) -> () in
            if let repositories = repositories {
                self.tableViewData = repositories
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let repoList = tableViewData[indexPath.row]
        cell.textLabel?.text = repoList.name
        return cell
    }
    
    // MARK: UISearchBarDelegate

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        GithubService.repositoriesForSearchTerm(searchBar.text!)
        searchBar.resignFirstResponder()
}

    func textFieldShouldReturn(textField: UITextField) -> Bool {
            searchBar.resignFirstResponder()
        return true
}
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.searchBar.endEditing(true)
//    }
}
