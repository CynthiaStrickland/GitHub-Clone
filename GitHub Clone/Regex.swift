//
//  Regex.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/12/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//
import Foundation

extension String {
    
    func validateForURL() -> Bool {
        
        var error: NSError?
        
        do {
            let regex = try NSRegularExpression(pattern: "[^0-9a-zA-Z]", options: [])
            let matches = regex.numberOfMatchesInString(self, options: [], range:NSRange(location: 0, length: self.characters.count))
            
            return matches > 0 ?  false : true
        } catch let error1 as NSError {
            error = error1
        }
        return false
    }
}