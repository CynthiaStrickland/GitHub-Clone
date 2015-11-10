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

    @IBAction func loginButton(sender: AnyObject) {
        
        if KeychainService.LoadFromKeychain() != nil {
            print("success")
        } else {
            
        }
        
    }
}
