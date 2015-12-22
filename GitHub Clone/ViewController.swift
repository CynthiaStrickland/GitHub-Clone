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
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewData = [Repository]() {
        didSet {
            self.tableView.reloadData()
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
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "User"
            let image = UIImage(named: "cat8 copy.jpg")
            _ = UIImageView(image: image)
        } else {
            cell.textLabel?.text = "Repo"
        }
        
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            self.performSegueWithIdentifier("userSegue", sender: nil)
        }
        
        if indexPath.row == 1 {
            self.performSegueWithIdentifier("repoSegue", sender: nil)
        }
    }
}
