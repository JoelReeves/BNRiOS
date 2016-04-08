//
//  TagsViewController.swift
//  Photorama
//
//  Created by Joel Reeves on 4/8/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit
import CoreData

class TagsViewController: UITableViewController {
    
    var store: PhotoStore!
    var photo: Photo!
    
    var selectedIndexPaths = [NSIndexPath]()
    
    let tagsDataSource = TagDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = tagsDataSource
    }
}
