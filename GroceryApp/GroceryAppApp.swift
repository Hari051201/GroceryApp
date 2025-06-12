//
//  GroceryAppApp.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI
import CoreData

@main
struct GroceryAppApp: App {
    @StateObject var cartVM = CartViewModel()
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(cartVM)
        }
    }
}



struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data: \(error)")
            }
        }
    }
}
