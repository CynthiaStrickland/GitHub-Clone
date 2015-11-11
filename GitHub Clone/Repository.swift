
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
    let repo: String?
    let user: String?
    
    init(name: String, repo: String?, user: String) {
        self.name = name
        self.repo = repo
        self.user = user
    }
}