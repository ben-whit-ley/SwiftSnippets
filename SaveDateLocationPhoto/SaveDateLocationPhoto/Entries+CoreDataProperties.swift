//
//  Entries+CoreDataProperties.swift
//  SaveDateLocationPhoto
//
//  Created by Ben Whitley on 6/21/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import Foundation
import CoreData


extension Entries {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entries> {
        return NSFetchRequest<Entries>(entityName: "Entries")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var entry: String?
    @NSManaged public var location: String?
    @NSManaged public var image: NSData?

}
