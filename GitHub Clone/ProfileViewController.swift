//
//  ProfileViewController.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedUser : User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedUser.image

    }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }



//        let image = UIImage(named: "cat8 copy.jpg")
//        let imageView = UIImageView(image: image)
//        self.imageView.addSubview(imageView)