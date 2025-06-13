//
//  SignupScreen.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI


struct SignupScreen: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""
    @State private var isSignedUp = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(spacing: 25) {
                    Image("signup")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 50)
                        .padding(.bottom, 20)
                        .padding(.top, 50)
                    
                    Spacer()
                    VStack(spacing: 20) {
                        Text("Create Account")
                            .font(.title)
                            .bold()
                        //                    .fontWeight(.bold)
                        VStack(spacing: 20) {
                            CustomTextField(icon: "person.fill", placeholder: "First Name", text: $firstName)
                            CustomTextField(icon: "person.fill", placeholder: "Last Name", text: $lastName)
                            CustomTextField(icon: "envelope.fill", placeholder: "Email", text: $email)
                            CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password)
                            CustomTextField(icon: "lock.fill", placeholder: "Confirm password", text: $confirmPassword)
                        }
                        
                        if !errorMessage.isEmpty {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.caption)
                                .padding(.horizontal)
                        }
                        
                        Button(action: handleSignUp) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .frame(maxWidth: 200)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        HStack {
                            Text("Already have an account")
                            NavigationLink(destination: LoginScreen()) {
                                Text("Log In")
                                    .foregroundColor(.blue)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: TabBarView(), isActive: $isSignedUp) {
                            EmptyView()
                        }
                    }
                    .padding()
                }
            }
            .padding(.bottom, 20)
            
            
        }
        .navigationBarBackButtonHidden(true)
    }

    func handleSignUp() {
        // Basic Validation
        guard !firstName.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "All fields are required."
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }

        // Simulate success (you can replace this with CoreData/Firebase logic)
        errorMessage = ""
        isSignedUp = true
    }
}


#Preview {
    SignupScreen()
}
