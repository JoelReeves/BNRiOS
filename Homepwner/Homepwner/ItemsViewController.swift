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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the heigth of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        // set the text on the cell with the description of the item that is at the nth index of items, where n = row
        // this cell will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // if the table view is asking to commit a delete command
        if editingStyle == .Delete {
            let item = itemStore.allItems[indexPath.row]
            
            // remove the item from the store & also remove that row from the table view with an animation
            itemStore.removeItem(item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    @IBAction func toggleEditingMode(sender: UIButton) {
        if editing {
            sender.setTitle("Edit", forState: .Normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", forState: .Normal)
            setEditing(true, animated: true)
        }
    }
    
    @IBAction func addNewItem(sender: UIButton) {
        // create a new item and add it to the ItemStore
        let newItem = itemStore.createItem()
        
        // figure out where that item is in the array
        if let index = itemStore.allItems.indexOf(newItem) {
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            
            // insert this new row into the table
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
}
