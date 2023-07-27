//
//  EmailLoginView.swift
//  RecipeApp
//
//  Created by russell price on 5/5/23.
//

import SwiftUI
import FirebaseAuth

struct EmailLoginView: View {
    enum Field {
        case email, password
    }
    @State private var path = NavigationPath()
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
        NavigationStack(path: $path){
            ZStack{
                Rectangle()
                    .fill(Gradient(colors: [.secondary, .teal]))
                    .ignoresSafeArea()
                VStack{
                    Text("Login")
                        .font(.system(.largeTitle, weight: .medium))
                        .fontWeight(.heavy)
                        .foregroundColor(.white.opacity(0.85))
                    HStack{
                        Image(systemName: "envelope.fill")
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
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    
                    HStack{
                        Image(systemName: "lock.fill")
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
                    .background(Color.white.opacity(0.5))
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
                                path.append("HomeScreenView")
                            }
                        }
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(width:225, height: 50)
                            .background(Color.blue.opacity(0.9))
                            .cornerRadius(10)
                            .fontWeight(.semibold)
                    }
                    .alert(alertMessage, isPresented: $showingAlert) {
                        Button("OK", role: .cancel){}
                    }
                    .navigationDestination(for: String.self) { view in
                        if view == "HomeScreenView" {
                            HomeScreenView()
                        }
                    }
                    Button{} label: {
                        Text("Forgot Password?")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .onAppear {
                        if Auth.auth().currentUser != nil {
                            print("Login Succcess")
                            path.append("HomeScreenView")
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.light)
    }
}
struct EmailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView()
    }
}
