//
//  LoginScreen.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

//import SwiftUI
//
//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @EnvironmentObject var userVM: UserViewModel
//
//    var body: some View {
//        VStack(spacing: 20) {
//            TextField("Email", text: $email)
//                .textFieldStyle(.roundedBorder)
//            SecureField("Password", text: $password)
//                .textFieldStyle(.roundedBorder)
//
//            Button("Login") {
//                if userVM.login(email: email, password: password) {
//                    // success
//                }
//            }
//
//            NavigationLink("Don't have an account? Sign up", destination: SignupView())
//        }
//        .padding()
//    }
//}
