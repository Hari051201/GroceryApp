//
//  SignupScreen.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI

struct SignupScreen: View {
    @StateObject var authVM = AuthViewModel()
    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .bold()
            
            TextField("Email", text: $authVM.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
            
            
        }
        
       
    }
}

#Preview {
    SignupScreen()
}
