//
//  CoreDataStack.swift
//  Luftborn‏‏Task
//
//  Created by Macintosh on 17/06/2022.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    var persistentContainer: NSPersistentContainer
    let mainContext: NSManagedObjectContext
    
    private init() {
        persistentContainer = NSPersistentContainer(name:  CoreDataStack.Defaults.coreDataName)
        let description = persistentContainer.persistentStoreDescriptions.first
        description?.type = NSSQLiteStoreType
        
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError("was unable to load store \(error!)")
            }
        }
        mainContext = persistentContainer.viewContext
       
    }
}

extension CoreDataStack {
    enum Defaults {
        static let coreDataName = "Model"
    }
    
    enum MemoryStorageType {
        case memory
        case disk
        
        var value: String {
            switch self {
                
            case .memory:
                return NSInMemoryStoreType
            case .disk:
                return NSSQLiteStoreType
            }
        }
    }
    
}
