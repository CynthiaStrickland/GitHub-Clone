//
//  LoginViewcontroller.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/10/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Security


class LoginViewcontroller: UIViewController {

    @IBAction func loginAction(sender: AnyObject) {
        
//        if KeychainService.LoadFromKeychain() = nil {
//            let hasLoginKey = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
//            if hasLoginKey == false {
//                NSUserDefaults.standardUserDefaults().setValue(self.usernameTextField.text, forKey: "username")
//            }
//        } else {
//            
//        }
//
//
//                
//                // 5.
//                MyKeychainWrapper.mySetObject(passwordTextField.text, forKey:kSecValueDataValue)
//                MyKeychainWrapper.writeToKeychain()
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasLoginKey")
//                NSUserDefaults.standardUserDefaults().synchronize()
//                loginButton.tag = loginButtonTag
//                
//                performSegueWithIdentifier("dismissLogin", sender: self)
//            } else if sender.tag == loginButtonTag {
//                // 6.
//                if checkLogin(usernameTextField.text!, password: passwordTextField.text!) {
//                    performSegueWithIdentifier("dismissLogin", sender: self)
//                } else {
//                    // 7.
//                    let alertView = UIAlertController(title: "Login Problem",
//                        message: "Wrong username or password." as String, preferredStyle:.Alert)
//                    let okAction = UIAlertAction(title: "Foiled Again!", style: .Default, handler: nil)
//                    alertView.addAction(okAction)
//                    self.presentViewController(alertView, animated: true, completion: nil)
//                }
//            }
//        }
//        
//        
//        
//        
//        
//            // 1.
//            if (usernameTextField.text == "" || passwordTextField.text == "") {
//                let alertView = UIAlertController(title: "Login Problem",
//                    message: "Wrong username or password." as String, preferredStyle:.Alert)
//                let okAction = UIAlertAction(title: "Foiled Again!", style: .Default, handler: nil)
//                alertView.addAction(okAction)
//                self.presentViewController(alertView, animated: true, completion: nil)
//                return;
//            }
//
//            // 2.
//            usernameTextField.resignFirstResponder()
//            passwordTextField.resignFirstResponder()
//
//            // 3.
//            if sender.tag == createLoginButtonTag {
//
}
