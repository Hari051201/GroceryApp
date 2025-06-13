//
//  ViewAllItems.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI

struct ViewAllItemsView: View {
    let title: String
    let items: [(name: String, price: String, desc: String)]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .padding()

                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(items, id: \.name) { item in
                        NavigationLink(destination: ProductDetailView(
                            name: item.name,
                            price: item.price,
                            imageName: item.desc
                        )) {
                            VStack(spacing: 8) {
                                Image(item.desc)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)

                                Text(item.name)
                                    .font(.subheadline)
                                    .fontWeight(.medium)

                                Text("₹\(item.price)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 2)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
}
