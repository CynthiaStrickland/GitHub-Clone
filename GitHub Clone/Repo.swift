//
//  Repo.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/9/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit


class Repo : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let squareFrame = CGRect(x: 20.0, y: 20.0, width: 100.0, height: 100.0)
        let square = UIView(frame: squareFrame)
        square.backgroundColor = UIColor.redColor()
        square.layer.cornerRadius = 5.0
        
        self.view.addSubview(square)
        
        NSOperationQueue().addOperationWithBlock { () -> Void in
            usleep(50000)
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
           
        UIView.animateWithDuration(0.4) { () -> Void in
        square.frame = CGRectOffset(squareFrame, 500.0, 500.0)
                }
            }
        }
    }
}

                    //ANIMATE CONSTRAINT













//        "id": 1296269,
//        "owner": {
//            "login": "octocat",
//            "id": 1,
//            ...
//        },
//        "name": "Hello-World",
//        "full_name": "octocat/Hello-World",
//        "description": "This your first repo!",
//        "private": false,
//        "fork": false,
//        "url": "https://api.github.com/repos/octocat/Hello-World",
//        "html_url": "https://github.com/octocat/Hello-World"
