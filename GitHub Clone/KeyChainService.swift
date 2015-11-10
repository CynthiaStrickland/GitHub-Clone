//
//  KeyChainService.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/10/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Security

    // Arguments for the keychain queries
let kSecClassValue = kSecClass as NSString
let kSecValueDataValue = kSecValueData as NSString
let kSecClassGenericPasswordValue = kSecClassInternetPassword as NSString
let kSecReturnDataValue = kSecReturnData as NSString

class KeychainService {
    
                //MARK: Save Somethin!
    class func save(data: NSString) {
                    //Convert our string to data
        let dataFromString: NSData = data.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
                    //    print("Data From String: \(dataFromString)")
                    //    print("")
        
                    //Create our keychain query with values to save as its objects
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [dataFromString], forKeys: [kSecValueDataValue])
        

        
                    // Delete any old item stored before our newone
        SecItemDelete(keychainQuery)
        
                    // Add the new keychain item. Pass in nil if we do not need the data back again.
        SecItemAdd(keychainQuery, nil)
    }
    
    
    
    
    //MARK: Load Somethin!
    
    class func LoadFromKeychain() -> NSString? {
        
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, kCFBooleanTrue], forKeys: [kSecClassValue, kSecReturnDataValue])
        
                    // Search for the keychain items
        var dataTypeRef :AnyObject?
        SecItemCopyMatching(keychainQuery, &dataTypeRef)
        
        
        var contentsOfKeychain: NSString?
        if let retainedData = dataTypeRef as? NSData {
            contentsOfKeychain = NSString(data: retainedData, encoding: NSUTF8StringEncoding)
            
        }
        
        return contentsOfKeychain
    }
}


