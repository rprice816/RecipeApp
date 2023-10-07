//
//  CreateAccountView.swift
//  RecipeApp
//
//  Created by russell price on 5/4/23.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct CreateAccountView: View {
    enum Field {
        case email, password, firstName, lastName
    }
    @StateObject private var viewModel = ViewModel()
    @State  var isLoggedIn = false
   @State private var showingAlert = false
    @State private var alertMessage: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @AppStorage ("uid") var userID: String = ""
    @FocusState private var focusField: Field?
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters, 1 uppercase, 1 special character
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }
    @EnvironmentObject private var authModel: AuthViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .fill(Gradient(colors: [.primaryColor2, .primaryColor1]))
                    .ignoresSafeArea()
                VStack{
                    Text("Create an Account")
                        .font(.system(.largeTitle, weight: .medium))
                        .fontWeight(.heavy)
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                    HStack{
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.primaryColor1)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            .focused($focusField, equals: .email)
                            .onSubmit {
                                focusField = .password
                            }
                        if (email.count != 0){
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                    }
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.secondaryColor1.opacity(0.65))
                    .cornerRadius(10)
                    .padding(3)
                    HStack{
                        Image(systemName: "pencil.line")
                            .foregroundColor(Color.primaryColor1)
                        TextField("First Name", text: $firstName)
                            .autocorrectionDisabled()
                            .submitLabel(.next)
                            .focused($focusField, equals: .firstName)
                            .onSubmit {
                                focusField = .lastName
                            }
                    }
                    .foregroundColor(Color.secondaryColor2.opacity(0.75))
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.secondaryColor1.opacity(0.65))
                    .cornerRadius(10)
                    .padding(3)
                    HStack{
                        Image(systemName: "pencil.line")
                            .foregroundColor(Color.primaryColor1)
                        TextField("Last Name", text: $lastName)
                            .autocorrectionDisabled()
                            .submitLabel(.next)
                            .focused($focusField, equals: .lastName)
                            .onSubmit {
                                focusField = .password
                            }
                    }
                    .foregroundColor(Color.secondaryColor2.opacity(0.75))
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.secondaryColor1.opacity(0.65))
                    .cornerRadius(10)
                    .padding(3)
                    HStack{
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color.primaryColor1)
                        SecureField("Password", text: $password)
                            .submitLabel(.done)
                            .focused($focusField, equals: .password)
                            .onSubmit {
                                focusField = nil
                            }
                        if (password.count != 0){
                            Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isValidPassword(password) ? .green.opacity(0.8) : .red.opacity(0.8))
                        }
                    }
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.secondaryColor1.opacity(0.65))
                    .cornerRadius(10)
                    .padding(3)
                    Text("* Password must contain a minimum of 6 characters with a * capitalized letter and special character")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.secondaryColor1.opacity(0.75))
                        .fontWeight(.medium)
                        .font(.caption)
                        .padding()
                    Button{
                        authModel.signUp( email: email, password: password)
                        if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, password: password) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(password, forKey: kPassword)
                        }
                    } label: {
                        Text("Create New Account")
                            .foregroundColor(.primaryColor1)
                            .frame(width:225, height: 50)
                            .background(Color.secondaryColor1.opacity(0.85))
                            .cornerRadius(10)
                            .fontWeight(.semibold)
                    }
                    .alert(alertMessage, isPresented: $showingAlert) {
                        Button("OK", role: .cancel){}
                    }
                    .navigationDestination(isPresented: $isLoggedIn){
                        HomeScreenView()
                    }
                }
            }
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
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
    }
}
struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
