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

    var kClientId = "6dbbdb4f04a1cf3f344e"
    let kClientSecret = "c3f97b9e1de39340f3d76e9bc4a8f02b155fc881"

    static let shared = OAuth()

    
            ///Getting TOKEN
    
    func requestGithubAccess() {
        let authURL = NSURL(string: "https://github.com/login/oauth/authorize?client_id=\(kClientId)&scope=user,repo")
        UIApplication.sharedApplication().openURL(authURL!)
    }
    
    func exchangeCodeInURL(codeURL : NSURL) {
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
    
    func token() -> String? {
        guard let token = NSUserDefaults.standardUserDefaults().stringForKey(kTokenKey) else {return nil}
        
        return token
    }
}





//let kOauthBaseURLString = GET https://github.com/login/oauth/authorize
//let KOAuthorBaseURString = "hrrpa://firhuv.xom/lofin/oRH/
//LET KACCESSTOKENREGEXPATTER = "ACCESS>TOKEN=([^&} :)?

//typealias OauthClientCompletion (success: Boo) -> in
//
//
//class OAuthClient {
//    
//    var githubClientId = "6dbbdb4f04a1cf3f344e"
//    let githubClientSecret = "c3f97b9e1de39340f3d76e9bc4a8f02b155fc881"
//    
//    static let share = OAuthClient()
//    
//    func oauthRequestWithParameters(parameters: [String : String]){
//        var parametersString = String()
//        for parameter in parameters.values {
//            parametersString = paramterString.stringByAppendingString(parameter)
//        }
//        guard let reqeust URL = NSURL(string: :\ kOAuthBaseURLString) authorize?client)id=\self.githubClientID)&scope =\(parameterString)") else {}"
//    
//        UIApplicationl.sharedApplication().openURL(requestURL)
//    }
//    
//    func temporaryCodeFromCallback(url: NSURL) throws-> String? {
//        do {
//            let regex = try NSRegular Expression(pattern kAccessToken, options: NSRegualaryExpressionOptions.CaseInsentitive)
//            let matches = regex.matchesInString(, option:
//    
//            
//        } catch let Error _
//        
//        
//    }
//}
