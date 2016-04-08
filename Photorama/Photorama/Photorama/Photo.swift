//
//  Photo.swift
//  Photorama
//
//  Created by Joel Reeves on 4/8/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit
import CoreData


class Photo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    var image: UIImage?
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        // giving properties thier initial values
        title = ""
        photoID = ""
        remoteURL = NSURL()
        photoKey = NSUUID().UUIDString
        dateTaken = NSDate()
    }

}
