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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func login(sender: AnyObject) {
        OAuth.shared.requestGithubAccess()
    }
    
}
