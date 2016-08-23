//
//  ReadStore.swift
//  coreDataTest
//
//  Created by ハラダ アズサ on 2016/08/23.
//  Copyright © 2016年 ハラダ アズサ. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ReadStore {
    
    let entityName:String = "Memo"
    let coreDataStack = CoreDataStack()
    
    let expiration: Int = 30
    var readDataList = [NSManagedObject]()
    
    class var sharedInstance :ReadStore {
        struct Static {
            static let instance = ReadStore()
        }
        return Static.instance
}

// read from CoreData
    func load() {
        self.readDataList = []
        /* Get ManagedObjectContext from AppDelegate */
        let manageContext = coreDataStack.managedObjectContext
        /* Set search conditions */
        let fetchRequest = NSFetchRequest(entityName: self.entityName)
        /* Get result array from ManagedObjectContext */
        let fetchResults = try! manageContext.executeFetchRequest(fetchRequest)
        if let results: Array = fetchResults {
            // データがロードされた時の処理
            for obj:AnyObject in results {
                self.readDataList.append(obj as! NSManagedObject)
            }
        }
}
    // Add an entry already read in CoreData
    func saveReadData(infoId: String, flag: String, viewId: String){
        /* Get ManagedObjectContext from AppDelegate */
        let managedContext: NSManagedObjectContext = coreDataStack.managedObjectContext
        /* Create new ManagedObject */
        let entity = NSEntityDescription.entityForName(self.entityName, inManagedObjectContext: managedContext)
        let obj = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        /* Set the name attribute using key-value coding */
        obj.setValue(infoId, forKey: "infoId")
        obj.setValue(flag, forKey: "flag")
        obj.setValue(viewId, forKey: "viewId")
        /* Error handling */
        try! managedContext.save()
        
    }
}

 