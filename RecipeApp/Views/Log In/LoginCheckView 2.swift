//
//  LoginCheckView.swift
//  RecipeApp
//
//  Created by russell price on 9/8/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
struct LoginCheckView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    var body: some View {
        Group {
            if authModel.user != nil {
                HomeScreenView()
            } else {
                EmailLoginView()
            }
        }.onAppear {
            authModel.listenToAuthState()
        }}
}

