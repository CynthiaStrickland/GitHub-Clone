//
//  OAuthClient.swift
//  GitHub Clone
//
//  Created by Cynthia Whitlatch on 11/9/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Security

let kTokenKey = "kTokenKey"
let kClientId = "6dbbdb4f04a1cf3f344e"
let kClientSecret = "c3f97b9e1de39340f3d76e9bc4a8f02b155fc881"

class OAuth {

    static let shared = OAuth()

    func requestGithubAccess() {
        let authURL = NSURL(string: "https://github.com/login/oauth/authorize?client_id=\(kClientId)&scope=user,repo")
        UIApplication.sharedApplication().openURL(authURL!)
    }
    
    func exchangeCodeInURL(codeURL : NSURL, completion: () -> ()) {
        if let code = codeURL.query {
            let request = NSMutableURLRequest(URL: NSURL(string: "https://github.com/login/oauth/access_token?\(code)&client_id=\(kClientId)&client_secret=\(kClientSecret)")!)
            request.HTTPMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if let httpResponse = response as? NSHTTPURLResponse {
                    if httpResponse.statusCode == 200 && data != nil {
                        do {
                            if let rootObject = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String : AnyObject] {
                                guard let token = rootObject["access_token"] as? String else {return}
                                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in

                                    KeychainService.save(token)
                                    completion()
                                })
                            }
                                                        
                        } catch let error as NSError {
                            print(error)
                        }
                    }
                }
            }).resume()
        }
    }

    func token() -> String? {
        guard let token = KeychainService.loadFromKeychain() else {return nil}
        return token as String
    }
}

