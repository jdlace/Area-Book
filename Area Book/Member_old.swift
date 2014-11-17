//
//  Member.swift
//  Area Book
//
//  Created by James Schultz on 9/27/14.
//  Copyright (c) 2014 Blue Boxen, LLC. All rights reserved.
//

import Foundation
import CoreData

class Member: NSManagedObject {

    @NSManaged var address: String
    @NSManaged var lastName: String
    @NSManaged var firstName: String
    @NSManaged var telephone: String
    
    class func member() -> Member {
        var member = NSEntityDescription.insertNewObjectForEntityForName("Member", inManagedObjectContext: DataModel.sharedInstance.managedObjectContext!) as Member
        return member
    }
    
    class func member(memberDict: Dictionary<String, AnyObject>) -> Member {
        var member = self.member()
        member.update(memberDict)
        return member
    }
    
    func update(memberDict: Dictionary<String, AnyObject>) {
        self.setValuesForKeysWithDictionary(memberDict)
    }
    
    override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        println("CLASS: %@ KEY: %@ VALUE: %@", self, key, value)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
}
