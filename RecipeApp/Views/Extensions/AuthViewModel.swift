//
//  AuthViewModel.swift
//  RecipeApp
//
//  Created by russell price on 9/8/23.
//

import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    func signUp(
        email: String,
        password: String
    ) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("an error occured: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
