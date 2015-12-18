//
//  GitHubServiceClass.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import Foundation

class GithubService {
    
    class func searchWithTerm(term: String, completion: (success: Bool, json: [String: AnyObject]) -> ()) {
        
        // This is the official URL, use it. This will work.
        // https://api.github.com/search/repositories?q=term
        
    }
    
    class func GETRepositories(completion: (success: Bool, json: [[String: AnyObject]]) -> ()) {
        
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
                        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! [[String: AnyObject]]
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            completion(success: true, json: json)

                        })
                    } catch _ {}
                }
            }).resume()
        }
    }
    
    class func userForSearchTerm(searchTerm : String, userSearchCallback : (errorDescription : String?, users :[User]?) -> (Void)) {
        let baseURL = "https://api.github.com/search/users"
        let finalURL = baseURL + "?q=\(searchTerm)"
        let request = NSMutableURLRequest(URL: NSURL(string: finalURL)!)
        if let token = KeychainService.loadFromKeychain() {
            request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let url = NSURL(string: finalURL) {
            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print("error")
                } else if let httpResponse = response as? NSHTTPURLResponse {
                    print(httpResponse)
                    
                    if httpResponse.statusCode == 200 {
                        if let users = UserJSONParser.usersFromJSONData(data) {
                            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                userSearchCallback(errorDescription: nil, users: users)
                            })
                        }
                    }
                    
                    userSearchCallback(errorDescription: nil, users: nil)
                    
                    
                }
            }).resume()
        }
        
    }

//    class func repositoriesForSearchTerm(searchTerm : String) {
//        let baseURL = "http://api.github.com/search/repositories?q=\(searchTerm)"
//        
//        if let url = NSURL(string: baseURL) {
//            NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
//                if let _ = error {
//                    print("error")
//                } else if let httpResponse = response as? NSHTTPURLResponse {
//                    print(httpResponse)
//                    
//                }
//            }).resume()
//        }
//        
//    }
}