//
//  RepoTableViewController.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 12/21/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class RepoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    class func identifier() -> String {
        return "RepoTableViewController"
    }
    @IBOutlet weak var RepoTableViewController: UITableView!
    @IBOutlet weak var RepoSearchBar: UISearchBar!
    
    var repositories = [User]() {
        didSet{
            self.RepoTableViewController.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.RepoSearchBar.delegate = self
        self.RepoTableViewController.dataSource = self
        self.RepoTableViewController.delegate = self
    }
    
    func getSearchRepo(searchTerm: String) {
        GithubService.GETRepositories() {(success, json) -> () in
            if success {
                // work with JSON
            }
        }
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoSeque", forIndexPath: indexPath)
        let repository = self.repositories[indexPath.row]
        cell.textLabel?.text = repository.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let repository = self.repositories[indexPath.row]
    }

    //MARK: UISearchBarDelegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        guard let searchTerm = searchBar.text else {return}
        self.getSearchRepo(searchTerm)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
//    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
//        print(text)
//        
//        if let searchText = searchBar.text{
//            let isValid = String.isValidString(searchText)
//            if String.isValidString(text){
//                return true
//            } else {
//                return false
//            }
//        }
//        return false
//    }
    }


