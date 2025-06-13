//
//  AddToCartView.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

//import SwiftUI
//
//
//struct AddToCartView: View {
//    let name: String
//    let price: String
//    let quantity: Int
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text(" Added to Cart!")
//                .font(.largeTitle)
//                .foregroundColor(.green)
//
//            Text("\(quantity) x \(name)")
//                .font(.title2)
//
//            Text("Total: \(calculateTotal())")
//                .font(.headline)
//                .foregroundColor(.blue)
//
//            Spacer()
//        }
//        .padding()
//        
//    }
//
//    func calculateTotal() -> String {
//        let priceValue = Double(price.replacingOccurrences(of: "$", with: "").replacingOccurrences(of: "/kg", with: "")) ?? 0
//        let total = priceValue * Double(quantity)
//        return String(format: "$%.2f", total)
//    }
//}
//
//
////#Preview {
////    AddToCartView()
////}
