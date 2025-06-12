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

    func fetchItems() {
        let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()
        do {
            items = try context.fetch(request)
        } catch {
            print("Failed to fetch cart items: \(error)")
        }
    }

    func addItem(name: String, price: String, quantity: Int) {
        let newItem = CartItem(context: context)
        newItem.id = Int16()
        newItem.name = name
        newItem.price = price
        newItem.quantity = Int64()
        items.append(newItem)

        saveContext()
        fetchItems()
    }

    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save cart item: \(error)")
        }
    }

    var totalPrice: String {
        let total = items.reduce(0.0) { result, item in
            let priceValue = Double(item.price?.replacingOccurrences(of: "$", with: "").replacingOccurrences(of: "/kg", with: "") ?? "") ?? 0
            return result + (priceValue * Double(item.quantity))
        }
        return String(format: "$%.2f", total)
    }
}

