//
//  ImageStore.swift
//  Homepwner
//
//  Created by Joel Reeves on 3/25/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class ImageStore {
    
    let cache = NSCache()
    
    // adding image to the dictionary
    func setImage(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key)
    }
    
    // retrieving image from the dictionary
    func imageForKey(key: String) -> UIImage? {
        return cache.objectForKey(key) as? UIImage
    }
    
    // deleting image from the dictionary
    func deleteImageForKey(key: String) {
        cache.removeObjectForKey(key)
    }
}
