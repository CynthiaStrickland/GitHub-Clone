//
//  Regex.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/12/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//
import Foundation

extension String {
    func validateUrl() throws -> Bool {
    
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$", options: [.CaseInsensitive])
        
        return regex.firstMatchInString(self, options:[],
            range: NSMakeRange(0, utf16.count)) != nil
        do {
            try "person@email.com".validateUrl()
        } catch {
            print(error)
        }
    }
}
