
//
//  Repository.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import Foundation


import Foundation

class Repository {
    
    let name: String
    let description: String?
    let owner: [String: AnyObject]
    
    init(name: String, description: String?, owner: [String:AnyObject]) {
        self.name = name
        self.description = description
        self.owner = owner
    }
}