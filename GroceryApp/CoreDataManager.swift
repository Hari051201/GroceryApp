//
//  CoreDataManager.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI
import CoreData

class CoreDataManager {
    static let shared  = CoreDataManager()
    let context: NSManagedObjectContext
    
    private init() {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores{ _,error in
            if let error = error {
                fatalError("Core data load failed:\(error.localizedDescription)")
            }
        }
        self.context  = container.viewContext
    }
}
