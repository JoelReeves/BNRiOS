//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Joel Reeves on 4/6/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import Foundation

enum Method: String {
    case RecentPhotos = "flickr.photos.getRecent"
}

struct FlickrAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    
    private static func flickrURL(method method: Method, parameters: [String:String]?) -> NSURL {
        return NSURL()
    }
}
