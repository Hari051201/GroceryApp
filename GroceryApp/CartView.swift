//
//  CartView.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI

struct CartView: View {
    let name: String
    let price: String
//    let imageName: String
    @State private var quantity: Int = 1
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
                List(cartVM.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name ?? "")
                            Text("Qty: \(item.quantity)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(item.price ?? "")
                    }
                }

                Text("Total: \(cartVM.totalPrice)")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
            }

            Spacer()
        }
    }
}



