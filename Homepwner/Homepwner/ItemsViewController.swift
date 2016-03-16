//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Joel Reeves on 3/16/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITabeViewCell", forIndexPath: indexPath)
        
        // set the text on the cell with the description of the item that is at the nth index of items, where n = row
        // this cell will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
}
