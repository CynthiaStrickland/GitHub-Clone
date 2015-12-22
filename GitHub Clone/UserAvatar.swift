//
//  UserAvatar.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/13/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class ImageService {
    
    class func fetchProfileImage(url : String, imageQueue : NSOperationQueue, completionHandler : (UIImage?) ->()) {
        imageQueue.addOperationWithBlock { () -> Void in
            if let url = NSURL(string: url) {
                if let imageData = NSData(contentsOfURL: url) {
                    if let image = UIImage(data: imageData) {
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            completionHandler(image)
                        })
                    }
                }
            }
        }
    }
}