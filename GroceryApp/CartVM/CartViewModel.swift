//
//  CartViewModel.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI
import CoreData

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []
    let context = PersistenceController.shared.container.viewContext

    init() {
        fetchItems()
    }

    // Fetch all cart items from Core Data
    func fetchItems() {
        let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()
        do {
            items = try context.fetch(request)
        } catch {
            print("Failed to fetch cart items: \(error)")
        }
    }

    // Add item to cart: if already exists, update quantity
    func addItem(name: String, price: String, quantity: Int) {
        let fetchRequest: NSFetchRequest<CartItem> = CartItem.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let results = try context.fetch(fetchRequest)
            if let existingItem = results.first {
                // Item already exists, update quantity
                existingItem.quantity += Int64(quantity)
            } else {
                // New item
                let newItem = CartItem(context: context)
                newItem.name = name
                newItem.price = price
                newItem.quantity = Int64(quantity)
            }

            try context.save()
            fetchItems()
        } catch {
            print("Failed to add or update cart item: \(error)")
        }
    }

    // Calculate total price of all items
    var totalPrice: String {
        let total = items.reduce(0) { result, item in
            let priceValue = Double(item.price?.replacingOccurrences(of: "$", with: "").replacingOccurrences(of: "/kg", with: "") ?? "") ?? 0
            return result + (priceValue * Double(item.quantity))
        }
        return String(format: "%.2f", total)
    }
}
