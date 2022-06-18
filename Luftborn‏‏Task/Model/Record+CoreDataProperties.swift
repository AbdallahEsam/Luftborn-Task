//
//  Record+CoreDataProperties.swift
//  Luftborn‏‏Task
//
//  Created by Macintosh on 17/06/2022.
//
//

import Foundation
import CoreData


extension Record {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "Record")
    }

    @NSManaged public var name: String?
    @NSManaged public var createAt: Date?

}

extension Record : Identifiable {

}
