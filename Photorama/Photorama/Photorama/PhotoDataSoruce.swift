//
//  PhotoDataSoruce.swift
//  Photorama
//
//  Created by Joel Reeves on 4/7/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class PhotoDataSoruce: NSObject, UICollectionViewDataSource {
    
    var photos = [Photo]()
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let identifier = "UICollectionViewCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
        
        return cell
    }
}
