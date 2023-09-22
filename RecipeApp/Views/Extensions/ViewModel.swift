//
//  ViewModel.swift
//  LittleLemonCapstone
//
//  Created by russell price on 7/22/23.
//


import Foundation
import Combine

public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "email key"
public let kIsLoggedIn = "kIsLoggedIn"
public let kPassword = "password key"

public let kFriendRequests = "friend request key"


class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var password = UserDefaults.standard.string(forKey: kPassword) ?? ""
    @Published var friendRequests = UserDefaults.standard.bool(forKey: kFriendRequests)
    
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    @Published var searchText = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String, password: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required"
            errorMessageShow = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        errorMessageShow = false
        errorMessage = ""
        return true
    }
}
