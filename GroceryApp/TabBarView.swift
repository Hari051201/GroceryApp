//
//  TabBarView.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI


struct TabBarView: View {
    var body: some View {
        HStack {
            Spacer()
            

            TabBarItem(icon: "house.fill", label: "Home")
            
            Spacer()
           
            NavigationLink(destination: CartView(name: "", price: "")) {
                TabBarItem(icon: "cart", label: "Cart")
            }

            Spacer()
            
            TabBarItem(icon: "person", label: "Profile")
            
            Spacer()
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(Color.white)
        .shadow(radius: 2)
    }
}


struct TabBarItem: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.top, 20 )
    }
}

#Preview {
    TabBarView()
}
