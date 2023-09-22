//
//  SettingsView.swift
//  RecipeApp
//
//  Created by russell price on 5/9/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.presentationMode) var presentation
    @Environment(\.dismiss) private var dismiss
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var friendRequests = true
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Gradient(colors: [.primaryColor2, .primaryColor1]))
                .ignoresSafeArea()
            VStack{
                Text("Settings")
                    .foregroundColor(.secondaryColor1.opacity(0.85))
                    .font(.title)
                    .font(.headline)
                Circle()
                    .stroke(Color.secondaryColor1, lineWidth: 2)
                    .frame(width: 150)
                    .padding()
                VStack{
                    Text("First name")
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.bold)
                    TextField("First Name", text: $firstName)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color.secondaryColor1.opacity(0.65))
                        .cornerRadius(10)
                        .foregroundColor(.secondaryColor2.opacity(0.65))
                }
                VStack {
                    Text("Last name")
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.bold)
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color.secondaryColor1.opacity(0.65))
                        .cornerRadius(10)
                        .foregroundColor(.secondaryColor2.opacity(0.65))
                }
                VStack {
                    Text("Email")
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.bold)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color.secondaryColor1.opacity(0.65))
                        .cornerRadius(10)
                        .foregroundColor(.secondaryColor2.opacity(0.65))
                }
                Button("Reset Password"){
                    // add reset password feature
                }
                .foregroundColor(.primaryColor1)
                .frame(width:200, height: 30)
                .background(Color.secondaryColor1.opacity(0.85))
                .cornerRadius(10)
                .padding(.top)
                VStack {
                    Toggle("Friend Request Notification On/Off", isOn: $friendRequests)
                }
                .tint(.blue.opacity(0.5))
                .fontWeight(.semibold)
                .foregroundColor(.secondaryColor1.opacity(0.85))
                .padding()
                Button("Save Changes"){
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, password: password) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(friendRequests, forKey: kFriendRequests)
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                .foregroundColor(.primaryColor1)
                .frame(width:225, height: 45)
                .background(Color.secondaryColor1.opacity(0.85))
                .cornerRadius(10)
                .fontWeight(.medium)
                if viewModel.errorMessageShow {
                    withAnimation() {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                }
                Spacer()
            }
            .padding()
            .disableAutocorrection(true)
            .padding()
        }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "arrow.uturn.backward.circle.fill")
                            .labelStyle(.iconOnly)
                    }
                    .tint(.secondaryColor1.opacity(0.8))
                }
            }
            .onAppear {
                firstName = viewModel.firstName
                lastName = viewModel.lastName
                email = viewModel.email
                
                friendRequests = viewModel.friendRequests
            }
            .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView()}
    }
}
