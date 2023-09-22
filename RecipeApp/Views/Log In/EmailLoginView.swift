//
//  EmailLoginView.swift
//  RecipeApp
//
//  Created by russell price on 5/5/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
struct EmailLoginView: View {
    enum Field {
        case email, password
    }
    @State private var isLoggedIn = false
    @State private var email:String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
     @State private var alertMessage: String = ""
    @AppStorage ("uid") var userID: String = ""
    @FocusState private var focusField: Field?
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters, 1 uppercase, 1 special character
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }

    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .fill(Gradient(colors: [.primaryColor2, .primaryColor1]))
                    .ignoresSafeArea()
                VStack{
                    Image(systemName: "book")
                        .resizable()
                        .frame(width:150, height: 100, alignment: .center)
                        .foregroundColor(.secondaryColor1.opacity(0.75))
                        .padding()
                    Text("Login")
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
                                .foregroundColor(email.isValidEmail() ? .green.opacity(0.8) : .red.opacity(0.8))
                        }
                    }
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.secondaryColor1.opacity(0.65))
                    .cornerRadius(10)
                    
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
                                .foregroundColor(isValidPassword(password) ? .green : .red)
                        }
                    }
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.secondaryColor1.opacity(0.65))
                    .cornerRadius(10)
                    .padding()
                    .padding()
                    
                    Button{
                        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                            if let error = error {
                                print(error)
                                alertMessage = "Login Error: \(error.localizedDescription)"
                                showingAlert = true
                            }
                            if let authResult = authResult {
                                print(authResult.user.uid)
                                userID = authResult.user.uid
                                isLoggedIn = true
                            }
                        }
                    } label: {
                        Text("Login")
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
                    NavigationLink("Don't Have an Account?", destination: CreateAccountView())
                        .foregroundColor(.secondaryColor1)
                        .padding()
                    Button{} label: {
                        Text("Forgot Password?")
                            .foregroundColor(.secondaryColor1)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
    }
}
struct EmailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView()
    }
}
