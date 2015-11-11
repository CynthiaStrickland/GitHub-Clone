//
//  LoginViewcontroller.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/10/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Security

typealias LoginViewcontrollerCompletion = () -> ()

class LoginViewcontroller: UIViewController {

    var completion: LoginViewcontrollerCompletion?
    
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
