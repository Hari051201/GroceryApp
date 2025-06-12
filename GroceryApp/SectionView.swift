//
//  SectionView.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI

struct SectionView: View {
    let title: String
    let items: [(name: String, price: String, desc: String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Button("View All") {}
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(items, id: \.name) { item in
                        // Wrap the full card in NavigationLink
                        NavigationLink(destination: ProductDetailView(
                            name: item.name,
                            price: item.price,
                            imageName: item.desc
                        )) {
                            VStack(spacing: 8) {
                                Image(item.desc)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)

                                Text(item.name)
                                    .font(.subheadline)
                                    .fontWeight(.medium)

                                Text(item.price)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 120)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 2)
                        }
                        .buttonStyle(PlainButtonStyle()) 
                    }
                }
                .padding()
                .padding(.horizontal)
            }
        }
    }
}
