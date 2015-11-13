//
//  User.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//


import UIKit

class User {
    let name: String
    let login : String
    let avatarURL : String
    let id : String
    var image : UIImage?
    
    init(name: String, login: String, avatarURL: String, id: String, image: UIImage) {
        self.name = name
        self.login = login
        self.avatarURL = avatarURL
        self.id = id
        self.image = image
    }
}