//
//  WebViewController.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/12/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://github.com")
        webView.loadRequest(NSURLRequest(URL: url!))
        webView.allowsBackForwardNavigationGestures = true
        
    }
}





