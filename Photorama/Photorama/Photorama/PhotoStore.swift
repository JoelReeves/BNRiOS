//
//  PhotoStore.swift
//  Photorama
//
//  Created by Joel Reeves on 4/6/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import Foundation

class PhotoStore {
    
    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
}
