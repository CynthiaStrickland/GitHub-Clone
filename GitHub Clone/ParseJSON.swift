//
//  ParseJSON.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

extension Repository {
    
    class func update(completion: (success: Bool, repositories:[Repository]?) -> ()) {
        
        GithubService.GETRepositories { (success, json) -> () in
            
            var repositories = [Repository]()
            for eachRepository in json {
                if let
                    name = eachRepository["name"] as? String,
                    description = eachRepository["description"] as? String,
                    owner = eachRepository["owner"] as? [String: AnyObject]
                {
                    
                    let repository = Repository(
                        name: name,
                        description: description,
                        owner: owner)
                        
                    repositories.append(repository)
            }
            }
            print(repositories)
            completion(success: true, repositories: repositories)
        }
        
    }
    
}

