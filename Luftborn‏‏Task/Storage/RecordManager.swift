//
//  RecordManager.swift
//  Luftborn‏‏Task
//
//  Created by Macintosh on 17/06/2022.
//

import Foundation
import CoreData

protocol RecordManagerProtocol {
    func createRecord(_ record: RecordModel, completion: @escaping (Record) -> Void)
    func fetchRecords() -> [Record]?
}

class RecordManager: RecordManagerProtocol{
    
    // MARK: Contexts
    let mainContext: NSManagedObjectContext
    
    /*
     Note: All fetches. Updates, creates, deletes can be background.
     Contexts are passed in so they can be overridden via unit testing.
     */
    
    // MARK: - Init
    init(mainContext: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.mainContext = mainContext
    }
}

// MARK: - Create
extension RecordManager {
    
    func createRecord(_ record: RecordModel, completion: @escaping (Record) -> Void) {
        mainContext.performAndWait {
            let newRecord = NSEntityDescription.insertNewObject(forEntityName: "Record", into: mainContext) as! Record
            newRecord.createAt = record.creationDate
            newRecord.name = record.taskType?.rawValue
            saveChanges()
            completion(newRecord)
        }
        
    }
    
    func saveChanges() {
        mainContext.performAndWait {
            if mainContext.hasChanges {
                do {
                    try mainContext.save()
                }
                catch {
                    print(error)
                }
            }
        }
    }
}


// MARK: - Fetch
extension RecordManager {
    
    func fetchRecords() -> [Record]? {
        let fetchRequest = Record.fetchRequest()
        var records: [Record]?
        mainContext.performAndWait {
            do {
                records = try mainContext.fetch(fetchRequest)
            } catch let error {
                print("Failed to fetch Record: \(error)")
            }
        }
        return records
    }
}




