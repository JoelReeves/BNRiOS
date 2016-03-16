//
//  ItemStore.swift
//  Homepwner
//
//  Created by Joel Reeves on 3/16/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
