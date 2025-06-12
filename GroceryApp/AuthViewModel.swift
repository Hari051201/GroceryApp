//
//  AuthViewModel.swift
//  GroceryApp
//
//  Created by Anil Kumar on 12/06/25.
//

import SwiftUI
import CoreData

class AuthViewModel: ObservableObject {
        @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isSignedUp = false
    
    
    let context = CoreDataManager.shared.context
    
    func sigUp() {
        guard !email .isEmpty, !password .isEmpty else {
            return
        }
        guard password == confirmPassword else {
            print("Passwords do not match")
            return
        }
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        do {
            let existingUsers = try context.fetch(fetchRequest)
            if !existingUsers.isEmpty {
                print("User already exists")
                return
            }
            let newUser = User(context: context)
            newUser.email = email
            newUser.password = password
            
            try context.save()
            isSignedUp = true
            print("User signed up successfully")
        } catch {
            print("Signup error:\(error.localizedDescription)")
        }
        
    }
    
    
}
