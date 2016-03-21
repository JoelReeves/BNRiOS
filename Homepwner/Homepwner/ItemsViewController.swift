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
    var itemsArray = [[Item]]()
    var itemsMoreThan50 = [Item]()
    var itemsLessThan50 = [Item]()
    let sectionTitles = ["Below $50", "Above $50"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the heigth of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        // seperating items based on thier prices into the 2 arrays
        for item in itemStore.allItems {
            if item.valueInDollars < 50 {
                itemsLessThan50.append(item)
            } else {
                itemsMoreThan50.append(item)
            }
        }
        
        itemsArray.append(itemsLessThan50)
        itemsArray.append(itemsMoreThan50)
        
        print(itemsArray)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemsArray.isEmpty {
            return 1
        } else {
            return itemsArray[section].count
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if itemsArray.isEmpty {
            return 1
        } else {
            return itemsArray.count
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if itemsArray.isEmpty {
            return nil
        } else {
            return sectionTitles[section]
        }
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == sectionTitles.count - 1 {
            return "No More Items!"
        } else {
            return ""
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if itemsArray.isEmpty {
            cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
            cell!.textLabel?.text = "No More Items"
            cell?.detailTextLabel?.text = ""
        } else {
            // get a new or recycled cell
            cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
            
            // set the text on the cell with the description of the item that is at the nth index of items, where n = row
            // this cell will appear in on the tableview
            let item = itemsArray[indexPath.section][indexPath.row]
            
            cell!.textLabel?.text = item.name
            cell!.detailTextLabel?.text = "$\(item.valueInDollars)"
        }
        
        return cell!
    }
    
}
