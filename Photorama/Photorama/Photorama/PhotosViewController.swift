//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Joel Reeves on 4/5/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    var store: PhotoStore!
    let photoDataSource = PhotoDataSoruce()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        
        store.fectchRecentPhotos() {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .Success(photos):
                print("successfully found \(photos.count) recent photos")
                
                if let firstPhoto = photos.first {
                    self.store.fetchImageForPhoto(firstPhoto) {
                        (imageResult) -> Void in
                        
                        switch imageResult {
                        case let .Success(image):
                            NSOperationQueue.mainQueue().addOperationWithBlock {
                                self.imageView.image = image
                            }
                        case let .Failure(error):
                            print("error downloading image: \(error)")
                        }
                    }
                }
                
            case let .Failure(error):
                print("error fetching recent photos: \(error)")
            }
        }
    }
}
