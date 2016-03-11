//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Joel Reeves on 3/11/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://www.bignerdranch.com")!
        webView.loadRequest(NSURLRequest(URL: url))
    }
}
