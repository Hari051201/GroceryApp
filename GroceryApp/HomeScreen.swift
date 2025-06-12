//
//  HomeScreen.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI

import SwiftUI

struct HomeScreen: View {
    let drinks = [
        ("Orange Juice", "30.00", "orangejuice"),
        ("Lemon Juice", "25.00", "lemonjuice"),
        ("water bottle", "40.00", "water"),
    ]
    
    let fruits = [
        ("Apple", "250.00/kg", "apple"),
        ("Banana", "80.00/kg", "banana"),
        ("Orange", "150.00/kg", "orange"),
    ]
    
    let vegetables = [
        ("Onion", "70.00/kg", "onion"),
        ("Beetroot", "60.00/kg", "beet"),
        ("Carrot", "50.00/kg", "carrot"),
        ("Tomato", "30.00/kg", "tomato"),
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
            
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Grocery Store")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                        SectionView(title: "Drink deals", items: drinks)
                        SectionView(title: "Fresh Fruits", items: fruits)
                        SectionView(title: "Vegetables", items: vegetables)

                        Spacer(minLength: 30)
                    }
                }

    
                TabBarView()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeScreen()
}
