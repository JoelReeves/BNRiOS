//
//  CoreDataStack.swift
//  Photorama
//
//  Created by Joel Reeves on 4/8/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    let managedObjectModelName: String
    
    required init(modelName: String) {
        managedObjectModelName = modelName
    }
}
