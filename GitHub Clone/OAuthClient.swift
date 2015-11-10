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

class OAuth {

        //Register App ---  // Obtain Client Id and Client Secret
    var kClientId = "6dbbdb4f04a1cf3f344e"
    let kClientSecret = "c3f97b9e1de39340f3d76e9bc4a8f02b155fc881"

        //Create constant Variable
    static let shared = OAuth()

        //Send User to the Service Login
    func requestGithubAccess() {
        let authURL = NSURL(string: "https://github.com/login/oauth/authorize?client_id=\(kClientId)&scope=user,repo")
        UIApplication.sharedApplication().openURL(authURL!)
    }
        //Once User has granted access, Github will send back URL with token using URI Scheme.  To Accept this add function to AppDelegate
        //This function is called everytime our app is opened from a URL.
    
    
        //  REQUEST TOKEN --> ACCESS TOKEN
    
    func exchangeCodeInURL(codeURL : NSURL) {
        if let code = codeURL.query {
                //Only one item in query in the url is the Request Token.  You can get it by calling .query on the url.
            
                //Next create the request to pass back the Access Token to GitHub
        
            let request = NSMutableURLRequest(URL: NSURL(string: "https://github.com/login/oauth/access_token?\(code)&client_id=\(kClientId)&client_secret=\(kClientSecret)")!)
            
                //It is easier to parse JSON we are setting our accept value in the HTTMHeader to "application/JSON"  Once created send the request with "dataTaskWithRequest".   Pass the request as well as create a completion handler.  When you parse the data you have access to the Access Token.
            
            request.HTTPMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if let httpResponse = response as? NSHTTPURLResponse {
                    if httpResponse.statusCode == 200 && data != nil {
                        
                        do {
                            
                            if let rootObject = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String : AnyObject] {
                                guard let token = rootObject["access_token"] as? String else {return}
                                
                                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                    NSUserDefaults.standardUserDefaults().setObject(token, forKey: kTokenKey)
                                    NSUserDefaults.standardUserDefaults().synchronize()
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
            //Save the Token to NSUserDefaults and return it
    func token() -> String? {
        guard let token = NSUserDefaults.standardUserDefaults().stringForKey(kTokenKey) else {return nil}
        
        return token
    }
}


