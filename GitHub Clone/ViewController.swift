//
//  ViewController.swift
//  GitHub Clone
//
//  Created by Cynthia Whitlatch on 11/9/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBAction func requestTokenButton(sender: AnyObject) {
        
        OAuth.shared.requestGithubAccess()
        
    }
    
    
    @IBAction func printTokenButton(sender: AnyObject) {
    
        print(OAuth.shared.token())
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        
        
    }



}

