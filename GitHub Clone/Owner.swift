//
//  Owner.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import Foundation

class Owner {
    
    let login: String
    let id: Int
    let url: String
    
    init(login: String, id: Int, url: String) {
        self.login = login
        self.id = id
        self.url = url
    }
}