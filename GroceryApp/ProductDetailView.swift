//
//  ProductDetailView.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI


struct ProductDetailView: View {
    let name: String
    let price: String
    let imageName: String
    @State private var quantity: Int = 1
    @State private var navigateToCart = false
    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .background(Color(.systemGray6))
                .cornerRadius(20)

            Text(name)
                .font(.title)
                .fontWeight(.bold)

            Text(price)
                .font(.title3)
                .foregroundColor(.gray)

            HStack {
                Text("Quantity:")
                    .font(.subheadline)
                Spacer()
                Button(action: {
                    if quantity > 1 {
                        quantity -= 1
                    }
                }) {
                    Image(systemName: "minus.circle")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                Text("\(quantity)")
                    .font(.title2)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)

            // NavigationLink (hidden trigger)
            NavigationLink(
                destination: CartView(
                    name: name,
                    price: price,
                
                ),
                isActive: $navigateToCart
            ) {
                EmptyView()
            }

            // Add to Cart Button
            Button(action: {
                cartVM.addItem(name: name, price: price, quantity: quantity) // ✅ Add to shared cart
                navigateToCart = true
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle(name)
    }
}



//#Preview {
//    ProductDetailView()
//}
