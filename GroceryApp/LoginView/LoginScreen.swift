//
//  LoginScreen.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//
import SwiftUI


struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Image("login")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 60)
                        .padding(.bottom, 20)
                        .padding(.top, 50)
                    Spacer()
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    VStack(spacing: 20) {
                        CustomTextField(icon: "envelope.fill", placeholder: "Email", text: $email)
                        CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password)
                        
                    }
                    .padding(.bottom, 20)
                    .padding(.top, 70)
                    
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.horizontal)
                    }
                    
                    Button(action: handleLogin) {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(maxWidth: 200)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    HStack {
                        Text("Don't have an account?")
                        NavigationLink(destination: SignupScreen()) {
                            Text(" Sign up")
                                .foregroundColor(.blue)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: TabBarView(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    func handleLogin() {
        // Simple validation logic
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill all fields."
            return
        }

        // Simulated login success
        // Replace this with real Firebase/CoreData check
        errorMessage = ""
        isLoggedIn = true
    }
}

#Preview {
    LoginScreen()
}
