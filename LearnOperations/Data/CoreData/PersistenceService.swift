//
//  PersistenceService.swift
//  LearnOperations
//
//  Created by Niraj on 17/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import Foundation
import CoreData

protocol PersistenceProtocol {
    func saveData(_ data:Data) throws
}

class PersistenceService {

    private init() { }

    private static var _sharedInstance = PersistenceService()

    class func sharedInstance() -> PersistenceService {
        return _sharedInstance
    }

    var context: NSManagedObjectContext { return persistenceContainer.viewContext }

    lazy var persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Operations")

        container.loadPersistentStores { description, error in
            if let error = error {
                print("Unresolved error,\(error)")
            }
        }
        return container
    }()

    func saveContext() {
        if persistenceContainer.viewContext.hasChanges {
            do {
                try persistenceContainer.viewContext.save()
            } catch {
                print("Error while saving data")
            }
        }
    }
}
