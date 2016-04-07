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
            
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                switch photosResult {
                case let .Success(photos):
                    print("successfully found \(photos.count) recent photos")
                    self.photoDataSource.photos = photos
                case let .Failure(error):
                    self.photoDataSource.photos.removeAll()
                    print("error fetching recent photos: \(error)")
                }
                
                self.collectionView.reloadSections(NSIndexSet(index: 0))
            }
        }
    }
}
