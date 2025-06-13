//
//  HomeScreen.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI



struct HomeScreen: View {
    @State private var isSearching = false
    @State private var searchText = ""

    let drinks = [
        ("Orange Juice", "30.00", "orangejuice"),
        ("Lemon Juice", "25.00", "lemonjuice"),
        ("Water Bottle", "20.00", "water")
    ]
    
    let fruits = [
        ("Apple", "200.00/kg", "apple"),
        ("Banana", "120.00/kg", "banana"),
        ("Orange", "210.00/kg", "orange")
    ]
    
    let vegetables = [
        ("Tomato", "50.00/kg", "tomato"),
        ("Onion", "60.00/kg", "onion"),
        ("Carrot", "50.00/kg", "carrot")
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            if isSearching {
                                TextField("Search...", text: $searchText)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.vertical, 5)
                            } else {
                                Text("Grocery Store")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }

                            Spacer()
                            Button(action: {
                                withAnimation {
                                    isSearching.toggle()
                                    if !isSearching {
                                        searchText = ""
                                    }
                                }
                            }) {
                                Image(systemName: isSearching ? "xmark.circle.fill" : "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .imageScale(.large)
                            }
                        }
                        .padding(.horizontal)

                        SectionView(title: "Drink deals", items: filteredItems(from: drinks))
                        SectionView(title: "Fresh Fruits", items: filteredItems(from: fruits))
                        SectionView(title: "Vegetables", items: filteredItems(from: vegetables))

                        Spacer(minLength: 30)
                    }
                }

                
            }
            TabBarView()
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Search Filtering
    func filteredItems(from items: [(String, String, String)]) -> [(String, String, String)] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.0.lowercased().contains(searchText.lowercased()) }
        }
    }
}


#Preview {
    HomeScreen()
}
