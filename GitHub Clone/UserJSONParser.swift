//
//  UserJSONParser.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/13/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class UserJSONParser {
    
    class func usersFromJSONData(jsonData : NSData) -> [User]? {
        if let rootObject = (try? NSJSONSerialization.JSONObjectWithData(jsonData, options: [])) as? [String : AnyObject],
                items = rootObject["items"] as? [[String : AnyObject]] {
                var users = [User]()
                    
                for item in items {
                    if let
                        name = item["name"] as? String,
                        login = item["login"] as? String,
                        avatarURL = item["avatar_url"] as? String,
                        id = item["id"] as? Int,
                        image = item["image"] as? UIImage
                    {
                            
                        let user = User(name: name, login: login, avatarURL: avatarURL, id: "\(id)", image: image)
                            users.append(user)
                    }
                }
                return users
        }
        return nil
    }
}