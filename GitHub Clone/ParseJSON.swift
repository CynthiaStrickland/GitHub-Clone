//
//  ParseJSON.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

typealias ModelExtensionsCompletionHandler = (success: Bool, object: AnyObject?) -> ()


extension Repository {
    
    class func update(completion: (success: Bool, repositories:[Repository]?) -> ()) {
        
        GETRespositoriesRequest() = { (success, json) -> () in
            
            var repositories = [Repository]()
            
            for eachRepository in json {
                
                if let name = eachRepository["name"] as? String, id = eachRepository["id"] as? Int, openIssues = eachRepository["open_issues_count"] as? Int, url = eachRepository["url"] as? String {
                    
                    let description = eachRepository["description"] as? String
                    let createdAt = NSDate.dateFromString(eachRepository["created_at"] as! String)
                    let language = eachRepository["language"] as? String
                    let owner = Owner.ownerWith(eachRepository["owner"] as! [String : AnyObject])
                    
                    let repository = Repository(name: name, description: description, id: id, createdAt: createdAt, openIssues: openIssues, url: url, language: language, owner: owner)
                    repositories.append(repository)
                }
            }
            
            completion(success: true, repositories: repositories)
        }
        
    }
    
}

