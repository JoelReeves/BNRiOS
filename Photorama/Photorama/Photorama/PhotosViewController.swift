//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Joel Reeves on 4/5/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fectchRecentPhotos() {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .Success(photos):
                print("successfully found \(photos.count) recent photos")
            case let .Failure(error):
                print("error fetching recent photos: \(error)")
            }
        }
    }
}
