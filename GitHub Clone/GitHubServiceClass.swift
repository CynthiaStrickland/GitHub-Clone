//
//  GitHubServiceClass.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import Foundation

class GithubService {
    
    class func searchWithTerm(term: String, completion: (success: Bool, json: [AnyObject]) -> ()) {
        
        // This is the official URL, use it. This will work.
        // https://api.github.com/search/repositories?q=term
        
    }
    
    class func GETRepositories(completion: (success: Bool, json: [AnyObject]) -> ()) {
        
        do {
            
            if let token = OAuth.shared.token() {
                guard let url = NSURL(string: "https://api.github.com/user/repos?access_token=\(token)") else { return }
                print(token)
                print(url)

            let request = NSMutableURLRequest(URL: url)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print(error)
                }
                
                if let data = data {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                        print(json)
                    } catch _ {}
                }
            }).resume()
        }
        } catch _ { print("token failed") }
    }
}