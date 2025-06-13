//
//  CartView.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI

struct CartView: View {

    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {
        VStack {
            Text("Your Cart")
                .font(.largeTitle)
                .padding()

            if cartVM.items.isEmpty {
                Text("No items in cart.")
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(cartVM.items, id: \.objectID) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name ?? "")
                                    .font(.headline)
                                Text("Qty: \(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text(item.price ?? "")
                        }
                    }
                }
                .listStyle(PlainListStyle())

                Text("Total: \(cartVM.totalPrice)")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
            }

            Spacer()
        }
    }
}




